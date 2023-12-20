<%
    String s1 = (String)session.getAttribute("un");
    if(s1!=null)
    {
%>
<html>
<head>
<link rel = "stylesheet" href="abc.css">
</head>

<body bgcolor="black">
<img id = "back"src = "bg.jpg">
<%@include file="Mymenu1.jsp"%>
</body>
</html>
<% 
}
else
{
          response.sendRedirect("Login.jsp");  
}
%>