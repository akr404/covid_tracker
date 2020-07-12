<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet"
href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<h4 style="color: red;">Register</h4>
	<div id="registerUser">
    <form method="POST" action="${contextPath}/register" class="form-signin">
        <div class="form-group form-row">
            <div class="form-group col-md-3">
            	<input name="username" type="text" class="form-control" placeholder="Username"
                   	autofocus="true"/>
            </div>
            <div class="form-group col-md-3">
            	<input name="password" type="password" class="form-control" placeholder="Password"/>
            </div>
            <div class="form-group col-md-3">
          		<input name="role" type="role" class="form-control" placeholder="admin or user"/>
          	</div>
        </div>
           	<span>${errorMsg}</span>
           	<div class="form-group row">
   			 <div class="col-sm-9">
            	<span>Already registered? <a href="/login" >Login</a></span>
            	</div>
         	</div>
            
          <div class="form-group row">
   			 <div class="col-sm-9">
            	<button class="btn btn-primary" type="submit">Register</button>	
            	</div>
         	</div>
        
		</form>
	</div>
</body>
</html>
