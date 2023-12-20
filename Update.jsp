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

<center>
<div id="tab">
<form action="Update.jsp">
<table cellpadding="7" id="instab">
<tr>
<th> Enter Roll no.</th> 
<th><input type ="text" size ="20" placeholder="  Enter Roll no." class="B" name="u1" required></th> 
</tr> 

<tr>
<th colspan="2"><input type = "submit" value = "Update" class = "A" name="b1"></th> 
</tr> 

</table>
</form>
    <%
    }
else
{
    response.sendRedirect("Login.jsp");
}
    %>
<%
    String s1=request.getParameter("b1");
    if(s1!=null)
    {
        String s2=request.getParameter("u1");
        try
        {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false","root","root");
	Statement st = con.createStatement();
	String q = "select * from marks where RN='"+s2+"'";
	ResultSet rs = st.executeQuery(q);
        %>
    <form action="Update.jsp">
    <table cellpadding='8' id='tab1'>
             <%if(rs.next())
                {
             %>  
                <tr>
		<td>Roll No</td>
		<td><input type ='text' size ='20' class='B' name='u1' value="<%=rs.getString(1)%>" readonly></td>
		</tr>

		<tr>
		<td>Name</td>
		<td><input type ='text' size ='20' class='B' name='u2' value="<%=rs.getString(2)%>" required></td>
		</tr>

                
		<tr>
		<td>Maths</td>
		<td><input type ='text' size ='20' class='B' name='u3' value="<%=rs.getString(3)%>" required></td>
		</tr>

		
		<tr>
		<td>Physics</td>
		<td><input type ='text' size ='20' class='B' name='u4' value="<%=rs.getString(4)%>" required></td>
		</tr>

		<tr>
		<td>Chemistry</td>
		<td><input type ='text' size ='20' class='B' name='u5' value="<%=rs.getString(5)%>" required></td>
		</tr>

                
		<tr>
		<th colspan='2'><input type = 'submit' value = 'Update' class = 'A' name="b2"></th>
		</tr>
		</table>   
                </form>
      <%}
        else
        {
        %>
	<h1 id="check">Invalid Roll No</h1>
        <%
        }
        }
        catch(Exception e)
        {
            out.println(e);
        }
}
        %>
</div>
</center>
</body>
</html>

<%
    String s3=request.getParameter("b2");
    if(s3!=null)
    {
String s11 = request.getParameter("u1");  
String s12 = request.getParameter("u2");  
String s13 = request.getParameter("u3");  
String s14 = request.getParameter("u4");  
String s15 = request.getParameter("u5");  
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false","root","root");
	Statement st = con.createStatement();
	String q = "update marks set Name='"+s12+"',Math='"+s13+"',Physics='"+s14+"',Chemistry='"+s15+"' where RN ='"+s11+"'";
	st.executeUpdate(q);
	response.sendRedirect("MenuDemo.jsp");
	con.close();
    }
catch(Exception e)
{
	out.println(e);
}
    }
%>