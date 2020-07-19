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
.container {
  padding:3px;
  border:1px solid #e6e6e6;
  width:1000px;
  overflow:hidden;
}
.marquee{
  display:block;
position:relative;
width:900px;
height:500px;
padding:3px;
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
<div class ="container" style= "background-color:lightblue">
<marquee class ="marquee" direction="up">${feed}</marquee>
</div>
</body>
</html>
