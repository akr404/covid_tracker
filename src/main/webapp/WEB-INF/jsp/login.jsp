<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet"
href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<body>

<div>
	<h3 style="color: red;">Login</h3>
    <form method="POST" action="${contextPath}/login" class="form-signin">
        <div class="form-group form-row">
	            <div class="form-group col-md-3">
	            	<input name="username" type="text" class="form-control" placeholder="Username"
	                   	autofocus="true"/>
	            </div>
	            <div class="form-group col-md-3">
	            	<input name="password" type="password" class="form-control" placeholder="Password"/>
	            </div>
        	</div>
        	<div class="form-group row">
   			 <div class="col-sm-9">
            	<span>Not registered? <a href="/register" >Register</br>
            	</div>
         	</div>
         	<div class="form-group row">
   			 <div class="col-sm-9">
            	<button class="btn btn-primary" type="submit">Log In</button>	
            	</div>
         	</div>
			 
        </div>

    </form>

</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script></body>
</html>
