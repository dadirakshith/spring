<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>


</head>
<body>
	<% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/InternalMarks?user=root&password=root";
			con = DriverManager.getConnection(url);
			
			String query = "Insert into FirstSem values(?,?,?,?,?)";  
			
			pstmt = con.prepareStatement(query);
			
			String path = "C://Users/Rakshith/Desktop/Book1.xlsx";
			//String name = request.getParameter("file");
			/* File f1 = new File(name);
			String path = f1.getAbsolutePath(); */
			/* String path = new File(name).getCanonicalPath();
			System.out.println(path); */
			
			File f= new File(path);
			FileInputStream file= new FileInputStream(f);
			
			//2.create work book
			Workbook wb = WorkbookFactory.create(file);
			
			//3.get sheet
			Sheet sh = wb.getSheet("Sheet1");
			
			int rc=sh.getLastRowNum();
			int rowsAffected = 0; 
			for(int i=0;i<=rc;i++)
			{
				ArrayList<Object> al = new ArrayList<Object>();
				int cc=sh.getRow(i).getLastCellNum();
				for(int j=0;j<cc;j++)
				{
					al.add(sh.getRow(i).getCell(j).toString());
			}
				int m = 1;
				for(int k = 0; k < al.size(); k++)
				{
					Object obj = al.get(k);
					if(obj instanceof String)
					{
						String s = (String)obj;
						pstmt.setString(m, s);
						m++;
					}
					else if(obj instanceof Integer)
					{
						int x = (Integer)obj;
						pstmt.setInt(m, x);
						m++;
					}
				}
				int count = pstmt.executeUpdate();
				rowsAffected++;
			}
			if(rowsAffected >= 1)
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("upload-m.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("upload-s.jsp");
				dispatcher.forward(request, response);
			}
			file.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
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