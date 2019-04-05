<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	width: auto;
	height: auto;
	margin: 3% 20%;
	padding: 1% 8%; 
	font-size: 20px;
	color: #fff;
	line-height: 33px;
	font-family: cursive;
	background: rgba(0,0,0,0.5);
}
table
{
	width: 100%;
	color: #fff;
	border-collapse: collapse;
}
table th
{
	height: 20px;
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
<h1>Marks</h1>
<div class="uploadMoc">
	<table border="2">
			<tr>
				<th>Subject Name</th>
				<th>Subject Code</th>
				<th>Internal Marks</th>
			</tr>
			
			<c:forEach var="result" items="${results}">
			
				<c:url var="updateLink" value="showFormForUpdate">
			
				<c:param name="usn" value="${usn}"/>
			
				</c:url>
			
			
				<tr>
					<td>${result.getSubjectName()}</td>
					<td>${result.getSubjectCode()}</td>
					<td>${result.getMarks()}</td>
					<td><a href="${updateLink}">Update</a>
				</tr>
	
			</c:forEach>
	</table>
</div>

</body>
</html>