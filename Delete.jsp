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
<form action="Delete.jsp">
<table cellpadding="7" id="instab">
<tr>
<th> Enter Roll no.</th> 
<th><input type ="text" size ="20" placeholder="  Enter Roll no." class="B" name="u1" required></th> 
</tr> 

<tr>
<th colspan="2"><input type = "submit" value = "Delete" class = "A" name="del"></th> 
</tr> 

</table>
</form>
   <%
    String s1=request.getParameter("del");
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
            String q1 = "delete from marks where RN='"+s2+"'";
			st.executeUpdate(q1);
        %>
       	<h1 id="check">Roll No <%=s2%> is deleted</h1>
        <%}
        else
        {%>
	<h1 id="check">Invalid Roll No.</h1>
        <%}
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
</div>

</body>
</html>
