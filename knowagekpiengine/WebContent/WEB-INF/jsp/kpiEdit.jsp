<%--
Knowage, Open Source Business Intelligence suite
Copyright (C) 2016 Engineering Ingegneria Informatica S.p.A.

Knowage is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

Knowage is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>


<%@ page language="java" pageEncoding="utf-8" session="true"%>
<%@include file="/WEB-INF/jsp/commons/angular/angularResource.jspf"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="templateBuild">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Template build</title>

<%@include file="/WEB-INF/jsp/commons/angular/angularImport.jsp"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/angular_1.x/kpi-dinamic-list/KpiDinamicList.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/angular_1.x/controllerBuildTemplate/kpiEditController.js"></script>
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/themes/sbi_default/css/commons/css/customStyle.css"> 
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/themes/sbi_default/css/designerKpi/designerCss.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/angular_1.x/style/kpiStyleController.js"></script>

</head>
<body ng-controller="templateBuildController">
<md-toolbar  class="miniheadimportexport" layout="row">
	<div class="md-toolbar-tools" flex>
		<h2 class="md-flex" >{{translate.load("sbi.kpidocumentdesigner")}}</h2>
	</div>
	<span flex></span>
	<md-button class="md-primary" ng-click="saveTemplate()">{{translate.load("sbi.general.save")}}</md-button>
	<!-- <md-button class="md-primary" >{{translate.load("sbi.general.close")}}</md-button> -->
</md-toolbar>
<md-whiteframe class="md-whiteframe-2dp relative" layout-fill layout-margin flex  >
	<md-radio-group layout="row" ng-model="typeDocument">
	     		<md-radio-button  value='list' >List</md-radio-button>
	     		<md-radio-button  value='widget'> Widget </md-radio-button>
   	</md-radio-group>
	<expander-box id="Info" color="white" ng-if="typeDocument=='list'" expanded="true" title="'KpiList'">
		<dinamic-list ng-model="selectedKpis" multi-select=true selected-item ="addKpis"></dinamic-list>  
	</expander-box>
	<expander-box id="Info" color="white" ng-if="typeDocument=='widget'" expanded="true" title="'KpiList'">
		<dinamic-list ng-model="selectedKpi" multi-select=false selected-item ="addKpis"></dinamic-list>  
	</expander-box>
	<expander-box id="Info" color="white" expanded="false" title="'Options'">
		 <md-whiteframe class="md-whiteframe-4dp layout-padding " layout="column" layout layout-fill layout-margin  >
		 
		 <div layout="row">
		 	<span flex = 15><h4>{{translate.load("sbi.kpidocumentdesigner.showvalue")}}:</h4></span>
		  	  <md-checkbox ng-model="options.showvalue" aria-label="show value">
          </md-checkbox>
		  	<!--  <md-radio-group layout="row" ng-model="options.showvalue">
	     		<md-radio-button  value='true' >{{translate.load("sbi.general.true")}}</md-radio-button>
	     		<md-radio-button  value='false'> {{translate.load("sbi.general.false")}} </md-radio-button>
   			 </md-radio-group>-->
		 </div>
		<div layout="row">
		 	<span flex = 15><h4>{{translate.load("sbi.kpidocumentdesigner.showtarget")}}:</h4></span>
   		 	<md-radio-group layout="row" ng-model="options.showtarget">
	    	<md-checkbox ng-model="options.showtarget" aria-label="show target">
   		</div>
   		<div layout="row">
		 	<span flex = 15><h4>{{translate.load("sbi.kpidocumentdesigner.showpercentage")}}:</h4></span>
   			 
	     		<md-checkbox ng-model="options.showtargetpercentage" aria-label="show percentage">
   			 </div>
   			 <div layout="row">
		 	<span flex = 15><h4>{{translate.load("sbi.kpidocumentdesigner.showgauge")}}:</h4></span>
   			 <md-radio-group layout="row" ng-model="options.showlineargauge">
	     		<md-checkbox ng-model="options.showlineargauge" aria-label="show linear gauge">
   			 </div>
   			 <div layout="row">
		 	<span flex = 15><h4>{{translate.load("sbi.kpidocumentdesigner.showthreshold")}}:</h4></span>
   			
	     		<md-checkbox ng-model="options.showthreshold" aria-label="show threshold">
   			 </div>
   			 
   			<span layout="row">
	   			<h4 flex=15>{{translate.load("sbi.kpidocumentdesigner.vieweas")}}</h4>
	   			<md-select aria-label="aria-label" flex=30 ng-model="options.vieweas">
					<md-option ng-repeat="view in typeOfWiew" value="{{view}}">{{view}}</md-option>
				</md-select>
   			</span>
   			<span layout="row">
			<md-input-container class="small counter" flex=15 > <label>{{translate.load("sbi.kpidocumentdesigner.precision")}}</label>
					<input class="input_class"ng-model="options.history.size"
						 type="number" min="0"> 
			</md-input-container>
			</span>
			<span layout="row">
				<h4 flex=15>Units</h4>
				<md-select aria-label="aria-label" flex=30 ng-model="options.history.units">
					<md-option ng-repeat="unit in units" value="{{unit}}">{{unit}}</md-option>
				</md-select>
			</span>
		 </md-whiteframe>
	</expander-box>
	<expander-box id="Info" color="white"  title="'Style'">
		<!-- direttiva style -->
		<kpi-style ng-model="style"></kpi-style>
	</expander-box>
</md-whiteframe>
</body>
</html>
