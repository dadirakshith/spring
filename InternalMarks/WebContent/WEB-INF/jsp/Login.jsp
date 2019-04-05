<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>log-in page</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Login.css"/>

</head>
<body >
	<h1>Welcome</h1>
	<h3>Mock Update Login Page</h3>
	
	 <nav>
   		<hr>
   			<a href="redirect:/">Home</a>
   			<a href="redirect:/">Login</a>
   			<a href="register">Register</a>
   		<hr>
   	</nav>
   	
	<div class="loginBox">
		<img alt="" src="User.png" class="user">
		<form action="signin">
			<p>User Name</p>
			<input type="text" placeholder="Enter the USN" name="usn" required>
			<p>Password</p>
			<input type="password" placeholder="password" name="pswd" required>
			<input type="submit" value="Sign in">
			<a href="Forgotpswd.jsp">Forgot password</a>
		</form>
	</div>
	
</body>
</html>