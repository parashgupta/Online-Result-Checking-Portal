<%
String s55 = (String)session.getAttribute("un");
    if(s55!=null)
    {
        %>
<%@page import="java.sql.*"%>

<html>
<head>
    <link rel="stylesheet" href="abc.css"/>
</head>

<body>
<img id="back" src="bg.jpg">

<%@include file="Mymenu1.jsp"%>
<%
    int recordsPerPage = 5; 
    int currentPage = 1;
    int total=0;
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
    Statement st = con.createStatement();
    ResultSet rs2 = st.executeQuery("Select count(rn) from marks");
    
    if(rs2.next())
    {
        total=rs2.getInt(1);
    }
    
    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }
    int offset = (currentPage - 1) * recordsPerPage; // Calculate the offset
    
    // Modify the SQL query to include pagination
    String q = "SELECT rn, name, math, physics, chemistry, " +
        "CASE WHEN (AVG((math + physics + chemistry) / 3) >= 90) AND (AVG((math + physics + chemistry) / 3) >= 99) THEN 'O' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 80) AND (AVG((math + physics + chemistry) / 3) >= 89) THEN 'A+' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 70) AND (AVG((math + physics + chemistry) / 3) >= 79) THEN 'A' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 60) AND (AVG((math + physics + chemistry) / 3) >= 69) THEN 'B+' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 50) AND (AVG((math + physics + chemistry) / 3) >= 59) THEN 'B' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 40) AND (AVG((math + physics + chemistry) / 3) >= 49) THEN 'C' " +
        "WHEN (AVG((math + physics + chemistry) / 3) >= 35) AND (AVG((math + physics + chemistry) / 3) >= 39) THEN 'P' " +
        "ELSE 'F' END AS Grade FROM marks GROUP BY rn LIMIT " + offset + ", " + recordsPerPage;

    
    ResultSet rs = st.executeQuery(q);
%>

    <table cellpadding='12' id='login'>
        <tr>
            <th>Roll No.</th>
            <th>Name</th>
            <th>Maths</th>
            <th>Physics</th>
            <th>Chemistry</th>
            <th>Grade</th>
        </tr>
        <%
        while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
        </tr>
        <%
        }
        con.close();
    }
    catch (Exception e1) {
        out.println(e1);
    }
    %>
    <tr>
        <th colspan="6">
            <div class="pagination">
        <%
        
        int totalPages = (int) Math.ceil((double) total / recordsPerPage);

        if (currentPage > 1) {
        %>
        <a href="ShowAll.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
        <%
        }
        for (int i = 1; i <= totalPages; i++) {
        %>
        <a href="ShowAll.jsp?page=<%= i %>"><%= i %></a>
        <%
        }
        if (currentPage < totalPages) {
        %>
        <a href="ShowAll.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
        <%
        }
        %>
    </div>
        </th>
        </tr>
    </table>
    
    
</body>
</html>
<%
}
else
{
    response.sendRedirect("Login.jsp");
}
%>