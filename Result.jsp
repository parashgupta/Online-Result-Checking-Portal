<%@page import="java.sql.*"%>
<html>
<head>
<link rel = "stylesheet" href="abc.css">
</head>

<body>
<img id = "back" src = "bg.jpg">

<%@include file="Mymenu.jsp"%>


<div id="tab">
<form action="Result.jsp">
<table cellpadding="7" id="instab">
<tr>
<th> Enter Roll no.</th> 
<th><input type ="text" size ="20" placeholder="  Enter Roll no." class="B" name="u1" required></th> 
</tr> 

<tr>
<th colspan="2"><input type = "submit" value = "Search" class = "A" name="search"></th> 
</tr> 

</table>
</form>
       <%
    String s1=request.getParameter("search");
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
        if(rs.next())
        {
        %>
        <table cellpadding='12' id='tab1'>
		
		<tr>
		<td>Roll No</td>
                <td><%=rs.getString(1)%></td>
		</tr>

		<tr>
		<td>Name</td>
                <td><%=rs.getString(2)%></td>
		</tr>

		<tr>
		<td>Maths</td>
                <td><%=rs.getString(3)%></td>
		</tr>

		<tr>
		<td>Physics</td>
                <td><%=rs.getString(4)%></td>
		</tr>

		<tr>
		<td>Chemistry</td>
                <td><%=rs.getString(5)%></td>
		</tr>
		
		</table>
        <%}
        else
        {%>
	<h1 id="check">Invalid Roll No</h1>
        <%}
    }
catch(Exception e)
{
out.println(e);
}
}
%>
</div>

</body>
</html>