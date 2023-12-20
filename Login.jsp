<%@page import="java.sql.*"%>
<html>
<head>
<link rel = "stylesheet" href="abc.css">
</head>

<body>
<img id = "back" src = "bg.jpg">

<%@include file="Mymenu.jsp"%>

<div>
<form action="Login.jsp">
<table cellpadding="12" id="login">
<tr>
<td>Username</td> 
<td><input type ="text" size ="20" placeholder="  Enter UserName" class="B" name ="un" required></td> 
</tr> 
<tr>
<td>Password</td> 
<td><input type ="password" size ="20" placeholder="  Enter Password" class="B" name ="up" required></td> 
</tr> 

<tr>
<th colspan="2"><input type = "submit" value = "Login" class = "A" name="log"></th> 
</tr> 

</table>
</form>
</div>
<%
    String s11=request.getParameter("log");
    if(s11!=null)
    {
String s1 = request.getParameter("un");  
String s2 = request.getParameter("up");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false","root","root");
	Statement st = con.createStatement();
	String q = "select * from login where USERNAME='"+s1+"'AND PASSWORD='"+s2+"'";
	ResultSet rs = st.executeQuery(q);
	if(rs.next())
        {
          session.setAttribute("un","Ram");
          response.sendRedirect("MenuDemo.jsp");  
        }
       else
        {%>
	<h1 id="check">Invalid Username and Password</h1>
        <%}
    }
catch(Exception e)
{
out.println(e);
}
}
%>
</body>
</html>