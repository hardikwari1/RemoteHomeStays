<%@ page import="java.sql.*" %>
<%
Connection conn=null;
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String userid=request.getParameter("userid");
String username=request.getParameter("username");
String password=request.getParameter("password");
String confirm=request.getParameter("confirm");
String email=request.getParameter("email");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hr");
}
catch(Exception e)
{
	System.out.println(e);
}

String SQL="insert into registration values (?,?,?,?,?,?,?)";
PreparedStatement pst=conn.prepareStatement(SQL);
pst.setString(1,firstname);
pst.setString(2,lastname);
pst.setString(3,userid);
pst.setString(4,username);
pst.setString(5,password);
pst.setString(6,confirm);
pst.setString(7,email);
pst.executeQuery();
response.sendRedirect("welcome.jsp");
%>