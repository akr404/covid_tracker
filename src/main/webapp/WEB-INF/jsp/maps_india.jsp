<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script 
 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src='https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.js'></script>
<link href='https://api.mapbox.com/mapbox-gl-js/v1.11.1/mapbox-gl.css' rel='stylesheet' />
<style>
* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 30%;
  padding: 10px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
</style>
</head>
<body>
<div align="right">
<span><a href="<c:url value="/logout" />">Logout</a></span></br>
<c:choose>
    <c:when test="${fn:substring(type, 0, 3) == 'use'}">
       <span><a href="<c:url value="/user" />">Home</a></span>
       <span><h5>User Dashboard</h5></span>
    </c:when>
    <c:otherwise>
       <span><a href="<c:url value="user" />">Home</a></span>
       <span><h5>Admin Dashboard</h5></span>
    </c:otherwise>
</c:choose>
<span><h5>${name}</h5></span>
</div>
<div class="row">
  <div class="column">
    <img src="http://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/India_COVID-19_cases_density_map.svg/800px-India_COVID-19_cases_density_map.svg.png" style="width:80%">
  </div>
  <div class="column">
    <img src="https://upload.wikimedia.org/wikipedia/commons/3/38/CSIR_Corona_Combat_Mission.png" style="width:80%">
  </div>
<div class="column">
<iframe title="Covid clusters" aria-label="map" id="datawrapper-chart-eKajF" src="https://datawrapper.dwcdn.net/eKajF/3/" scrolling="no" frameborder="0" style="width: 0; min-width: 100% !important; border: none;" height="722"></iframe><script type="text/javascript">!function(){"use strict";window.addEventListener("message",(function(a){if(void 0!==a.data["datawrapper-height"])for(var e in a.data["datawrapper-height"]){var t=document.getElementById("datawrapper-chart-"+e)||document.querySelector("iframe[src*='"+e+"']");t&&(t.style.height=a.data["datawrapper-height"][e]+"px")}}))}();
</script>
  </div>
</div>
</body>
</html>
