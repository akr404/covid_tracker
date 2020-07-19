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
<style>

h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


/* follow me template */
.made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #F50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
}


/* for custom scrollbar for webkit browser*/

::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}
</style>
</head>
<body>
<div align="right">
<span><a href="<c:url value="/logout" />">Logout</a></span>
<span><h5>User Dashboard</h5></span>
<span><h5>${name}</h5></span>
</div>
<div align="center" >
	<h1>Welcome to Covid-19 Dashboard</h1>
	<div>
	  <table cellpadding="0" cellspacing="0" border="0">
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
	    <tr>
	      <th scope="row">Total Active cases</th>
	      <td>${summary[0][0].active_cases}</td>
	    </tr>
	    <tr>
	      <th scope="row">Total Active cases</th>
	      <td>${summary[0][0].last_total_recovered_cases}</td>
	    </tr>
	    <tr>
	      <th scope="row">Total Recovered cases</th>
	      <td>${summary[0][0].death_cases}</td>
	    </tr>
	    <tr>
	      <th scope="row">Death rate</th>
	      <td>${summary[0][0].death_rate}</td>
	    </tr>
	  </tbody>
	</table>
	<div class="container">
	  <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Check Statewise data</button>
	  <div id="demo" class="collapse">	
		<div>
		<table cellpadding="0" cellspacing="0" border="0">
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
		<span><a href="<c:url value="/rss_feed" />">Top News</a></span>
	</div>
	</div>

	
</div>	
</body>
</html>
