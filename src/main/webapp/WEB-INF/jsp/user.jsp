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
</head>
<body>
<div align="right">
<span><a href="<c:url value="/logout" />">Logout</a></span>
<span><h5>User Dashboard</h5></span>
<span><h5>${name}</h5></span>
</div>
<div align="center">
	<h2>Welcome to Covid-19 Dashboard</h2>
	  <table class="table">
	  <thead>
	    <tr>
	      <th scope="col">INDIA</th>
	      <th scope="col"> </th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <th scope="row">Total Confirmed cases</th>
	      <td>${summary[0][0].confirmed_cases}</td>
	    </tr>
	    <tr class="table-active">
	      <th scope="row">Total Active cases</th>
	      <td>${summary[0][0].active_cases}</td>
	    </tr>
	    <tr class="table-success">
	      <th scope="row">Total Active cases</th>
	      <td>${summary[0][0].last_total_recovered_cases}</td>
	    </tr>
	    <tr class="table-warning">
	      <th scope="row">Total Recovered cases</th>
	      <td>${summary[0][0].death_cases}</td>
	    </tr>
	    <tr class="table-dark">
	      <th scope="row">Death rate</th>
	      <td>${summary[0][0].death_rate}</td>
	    </tr>
	  </tbody>
	</table>
	<div class="container">
	  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Check Statewise data</button>
	  <div id="demo" class="collapse">	
		<div class="table-responsive">
		<table>
		    <tr>
		    	<th>State</th>
		        <th>Confirmed</th>
		        <th>Active</th>
		        <th>Recovered</th>
		        <th>Deaths</th>
		        <th>Death Rate</th>
		    </tr>
		   
		   <c:forEach  var="entry"  items="${summary[0][1].state_data}" > 
			    <tr>
			      
			         	<th><c:out value="${entry.state}"></c:out></th>
			            <td><c:out value="${entry.confirmed}"></c:out></td>
			            <td><c:out value="${entry.active}"></c:out></td>
			            <td><c:out value="${entry.recovered}"></c:out></td>
			            <td><c:out value="${entry.death}"></c:out></td>
			            <td><c:out value="${entry.death_rate}"></c:out></td>
			        
			
			    </tr>
			</c:forEach>
		</table>
		</div>
	  </div>
	</div>
	<div  class="container" align="center">
		<span><a href="<c:url value="/graphs_india" />">Covid Graph</a></span>
	</div>
		<div  class="container" align="center">
		<span><a href="<c:url value="/maps_india" />">Covid Maps</a></span>
	</div>
	<div  class="container" align="center">
		<marquee behavior="scroll" direction="left">Here is some scrolling text... right to left!</marquee>
	</div>
	
</div>	
</body>
</html>
