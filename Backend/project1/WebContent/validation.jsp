<%@ page import="java.sql.*" %>
<%
Connection conn=null;
String username=request.getParameter("username");
String password=request.getParameter("password");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hr");
}
catch(Exception e)
{
	System.out.println(e);
}

String SQL="select * from registration where username=? and password=?";
PreparedStatement pst=conn.prepareStatement(SQL);
pst.setString(1,username);
pst.setString(2,password);

ResultSet rs=pst.executeQuery();
if(rs.next())
{
	application.setAttribute("user",username);
	response.sendRedirect("welcome.jsp");
}
else
{
	response.sendRedirect("error.jsp");
}
%>