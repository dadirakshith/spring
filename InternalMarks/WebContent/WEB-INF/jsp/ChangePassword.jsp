<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String buser = request.getParameter("user");
		String bpswd = request.getParameter("pswd");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/InternalMarks?user=root&password=root";
			con = DriverManager.getConnection(url);
			
			String query = "update Userdetails set pswd = ? where username = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bpswd);
			pstmt.setString(2, buser);
			
			int count = pstmt.executeUpdate();
			if(count >= 1)
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("Forgotpswd.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher("Forgotpswd.jsp");
			dispatcher.forward(request, response);
		}
		finally
		{
			if(con != null)
			{
				try
				{
					con.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
			}
			
			if(pstmt != null)
			{
				try
				{
					pstmt.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
			}
			
		}
		
	%>
</body>
</html>