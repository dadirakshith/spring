<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Options</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/upload.css"/>

</head>
<body >
	<div class="header">
		<h1>Upload Options</h1>
   	</div>
	
	<div class="head">
	<a href="viewstudents"><button class="buttons"><p>View Student Details</p></button></a><br><br>
	<a href="checkmarks"><button class="buttons"><p>Check Marks</p></button></a><br><br>
	</div>
	
	<div class="row">
	
	<div class="column">
		<a href="upload-m"><button class="buttons"><p>Upload Marks</p></button></a><br><br>
	</div>
		
	<% application.setAttribute("studentusn", request.getParameter("usn")); %>
</div>
</body>
</html>