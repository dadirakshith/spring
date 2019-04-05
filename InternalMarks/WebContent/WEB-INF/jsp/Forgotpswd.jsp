<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget password</title>
<link rel="stylesheet" type="text/css" href="Login.css" />
</head>
<body>
	<h1>forget password</h1>
	<h3>please change the password</h3>
	<nav>
   		<hr>
   			<a href="Homepage.jsp">Home</a>
   			<a href="Login.jsp">Login</a>
   			<a href="Register.jsp">Register</a>
   		<hr>
   	</nav>
	
	<div class="loginBox">
		<img alt="" src="User.png" class="user">
		<form action="ChangePassword.jsp">
			<p>User Name</p>
			<input type="text" placeholder="username" name="user" required>
			<p>Enter New Password</p>
			<input type="password" placeholder="password" name="pswd" required>
			<input type="submit" value="Update">
		</form>
	</div>
</body>
</html>