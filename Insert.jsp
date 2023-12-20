<%
String s55 = (String)session.getAttribute("un");
    if(s55!=null)
    {
        %>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel = "stylesheet" href="abc.css">
</head>

<body>
<img id = "back" src = "bg.jpg">

<%@include file="Mymenu1.jsp"%>


<div id="tab">
<center>
<form action="Insert.jsp">
<table cellpadding="7" id="login">
<tr>
<td> Enter Roll no.</td> 
<td><input type ="text" size ="20" placeholder="  Enter Roll no." class="B" name="u1" required></td> 
</tr> 

<tr>
<td>Enter Name</td> 
<td><input type ="text" size ="20" placeholder="  Enter Name" class="B" name="u2" required></td> 
</tr> 

<tr>
<td>Enter Math</td> 
<td><input type ="text" size ="20" placeholder="  Enter Marks" class="B" name="u3" required></td> 
</tr> 

<tr>
<td>Enter Physics</td> 
<td><input type ="text" size ="20" placeholder="  Enter Marks" class="B" name="u4" required></td> 
</tr> 

<tr>
<td>Enter Chemistry</td> 
<td><input type ="text" size ="20" placeholder="  Enter Marks" class="B" name="u5" required></td> 
</tr> 


<tr>
<th colspan="2"><input type = "submit" value = "Insert" class = "A" name="insert"></th> 
</tr> 

</table>
</form>
</center>
</div>
<%
    String ins=request.getParameter("insert");
    if(ins!=null)
    {
      String s1 = request.getParameter("u1");  
String s2 = request.getParameter("u2");  
String s3 = request.getParameter("u3");  
String s4 = request.getParameter("u4");  
String s5 = request.getParameter("u5");  
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false","root","root");
	Statement st = con.createStatement();
	String q = "insert into marks values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')";
	st.executeUpdate(q);
	response.sendRedirect("MenuDemo.jsp");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
    }
    }
else
{
    response.sendRedirect("Login.jsp");
}
    %>
</body>
</html>