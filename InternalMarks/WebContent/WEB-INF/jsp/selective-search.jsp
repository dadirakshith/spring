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
	width: 15%;
	height: 300px;
	margin-left :40%;
	margin-top: 3%;
	padding: 1% 5%; 
	font-size: 18px;
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
<form action="searchmarks">
		
		<input hidden="hidden" name="usn" value=<%= (String)(application.getAttribute("studentusn")) %>>
		
		<label class="container"><font style="color: white;">First Sem</font>
 		 <input type="radio" checked="checked" name="sem" value="1">
 		 <span class="checkmark"></span>
		</label>
		<label class="container"><font style="color: white;">Second Sem</font>
		  <input type="radio" name="sem" value="2">
		  <span class="checkmark"></span>
		</label>
		<label class="container"><font style="color: white;">Third Sem</font>
		  <input type="radio" name="sem" value="3">
		  <span class="checkmark"></span>
		</label>
		<label class="container"><font style="color: white;">Fourth Sem</font>
		  <input type="radio" name="sem" value="4">
		  <span class="checkmark"></span>
		</label>
		<label class="container"><font style="color: white;">Fifth Sem</font>
		  <input type="radio" name="sem" value="5">
		  <span class="checkmark"></span>
		</label>
		<label class="container"><font style="color: white;">Sixth Sem</font>
		  <input type="radio" name="sem" value="6">
		  <span class="checkmark"></span>
		</label>
	
    <input type="submit" value="Search" class="inp" />
</form>
</div>

</body>
</html>