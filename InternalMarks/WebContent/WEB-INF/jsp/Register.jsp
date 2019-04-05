<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Register.css"/>
</head>
<body >
	<h1>Please fill up the Details</h1>
	
	<nav>
   		<hr>
   			<a href="/">Home</a>
   			<a href="/">Login</a>
   			<a href="register">Register</a>
   		<hr>
   	</nav>
	
	<div class="loginBox">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/User.png" class="user">
		<form:form action="registerstudent" modelAttribute="student">
			<form:input type="text" placeholder="Enter USN" path="usn" required="required"/>
			<form:input type="text" placeholder="Enter First Name" path="firstName" required="required"/>
			<form:input type="text" placeholder="Enter Middle Name" path="middleName" required="required"/>
			<form:input type="text" placeholder="Enter Last Name" path="lastName" required="required"/>
			<form:input type="text" placeholder="Enter College Name" path="collegeName" required="required"/>
			<form:input type="text" placeholder="Enter Degree" path="degree" required="required"/>
			<p>Gender</p><br>
			<font color=#fff>Male</font><form:radiobutton path="gender" value="male" checked="checked"/>
			<font color=#fff>Female</font><form:radiobutton path="gender" value="female"/>
			<font color=#fff>Others</font><form:radiobutton path="gender" value="others"/><br><br>
			
			<form:input type="password" placeholder="password" path="password" required="required"/>
			
			<input type="submit" value="Register"/>
			
		</form:form>
	</div>

</body>
</html>