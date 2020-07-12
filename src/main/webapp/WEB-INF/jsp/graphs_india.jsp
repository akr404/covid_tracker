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
<script type="text/javascript">
window.onload = function() { 
	var timeline = '${timeline}';
	var data = $.parseJSON(timeline);
	$.each(data, function(index,item){
	    item.x = new Date(item.x.split("T")[0]);
	});
	var chart = new CanvasJS.Chart("chartContainer", {
		title:{
			text: "Live Covid-19 cases per day"
		},
		axisX:{
			valueFormatString: "DD MMM"
		},
		axisY: {
			title: "Number of Cases found",
			includeZero: false,
			scaleBreaks: {
				autoCalculate: true
			}
		},
		data: [{
		    type: "line",
		    xValueFormatString: "DD MMM",
		    color: "#F08080",
			dataPoints : data
		}]
	});
	chart.render();
	} 
</script>
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
<div id="chartContainer" style="height: 370px; width: 100%;">
</div>
</body>
</html>
