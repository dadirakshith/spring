<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.jspiders.internalmocksystem.dto.StudentDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload marks</title>
<style type="text/css">
h1
{
	text-align: center;
	text-decoration: inherit;
	color: #f2f2f2;
	size: 40px;
	width: 25%;
	border-radius: 10px;
	margin-left: 40%;
	border:2px solid #3366ff;
	background: rgba(0,0,0,0.5);
}
.head
{
	position: absolute;
	text-align:center;
	border:2px solid #3366ff;
	float:left;
	top: 50%;
	left: 13%; 
	transform: translate(-50%,-50%);
	padding-top:50px;
	padding-bottom:35px;
	width: 22%;
	height: 38%;
	border-radius: 10px;
	background: rgba(0,0,0,0.5); 
}


.inp
{
	height: 30px;
	width: 150px;
	margin-left: 15px;
	background-color: #3366ff;
	border-radius:10px;
	box-shadow:black;
	text-align: center;
	color: #ffffff;
	font-size:12px;
	font-weight: bolder;
	font-family:sans-serif;
}
.buttons
{
	height: 40px;
	width: 200px;
	background-color: #3366ff;
	border-radius:10px;
	box-shadow:black;
	text-align: center;
}

p
{
	color: #ffffff;
	font-size:small;
	font-weight: bolder;
	font-family:inherit;
}

.uploadMoc
{
	border: blue solid 2px;
	border-radius: 25px;
	width: 18%;
	height: 300px;
	margin-left :40%;
	margin-top: 3%;
	padding: 1% 8%; 
	font-size: 20px;
	color: #fff;
	line-height: 33px;
	font-family: cursive;
	background: rgba(0,0,0,0.5);
}

.container 
{
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 18	px;
}

.container input
{
  position: absolute;
  opacity: 0;
  cursor: pointer;
}

.checkmark
 {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

.container:hover input ~ .checkmark
{
  background-color: #ccc;
}

.container input:checked ~ .checkmark 
{
  background-color: #2196F3;
}

.checkmark:after 
{
  content: "";
  position: absolute;
  display: none;
}

.container input:checked ~ .checkmark:after 
{
  display: block;
}

.container .checkmark:after 
{
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
.header
 {
   text-align:center;
   padding:20px;
 }
body
 {
 	background-image: url("${pageContext.request.contextPath}/resources/images/background2.jpeg");
 	background-repeat: no-repeat;
 	background-size: cover;
 }

</style>
</head>
<body>

	<div class="header">
		<h1>Upload Marks</h1>
   	</div>
<div class="head">
	<a href="viewstudents"><button class="buttons"><p>View Student Details</p></button></a><br><br>
	<a href="checkmarks"><button class="buttons"><p>Check Marks</p></button></a><br><br>
</div>

<div class="uploadMoc">
	
	<%
	
		String usn = (String) application.getAttribute("studentusn");
	
		Session s = new Configuration().configure().buildSessionFactory().openSession();
		
		StudentDTO student = s.get(StudentDTO.class, usn);
		
		System.out.println(student);
		
		s.close();
	%>
	
	USN : <%= student.getUsn() %><br>
	First Name : <%= student.getFirstName() %><br>
	Middle Name : <%= student.getMiddleName() %><br>
	Last Name : <%= student.getLastName() %><br>
	College Name : <%= student.getCollegeName() %><br>
	Gender : <%= student.getGender() %><br>
	Degree : <%= student.getDegree() %><br>
	
</div>

</body>
</html>