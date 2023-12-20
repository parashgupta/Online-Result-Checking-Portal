<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="abc.css"/>
</head>

<body>
<img id="back" src="bg.jpg">

<%@include file="Mymenu1.jsp"%>
<%
    int recordsPerPage = 5; // Number of records to display per page
    int currentPage = 1; // Default current page
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");
    Statement st = con.createStatement();
    
    // Pagination variables
    
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
        "WHEN (AVG((math + physics + chemistry) / 3) >= 0) AND (AVG((math + physics + chemistry) / 3) <= 34) THEN 'F' ELSE 'Absent' END AS Grade " +
        "FROM marks GROUP BY rn LIMIT " + offset + ", " + recordsPerPage;
    
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
    </table>
    
    <div class="pagination">
        <%
        // Calculate the total number of records (you can replace 100 with the actual number)
        int totalRecords = 100;
        
        // Calculate the total number of pages
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        
        if (currentPage > 1) {
        %>
        <a href="Result1.jsp?page=<%= currentPage - 1 %>">&laquo; Previous</a>
        <%
        }
        
        if (currentPage < totalPages) {
        %>
        <a href="Result1.jsp?page=<%= currentPage + 1 %>">Next &raquo;</a>
        <%
        }
        %>
    </div>
</body>
</html>
