<%@page import="java.sql.*"%>
<html>
<head>
<link rel ="stylesheet" href="abc.css">
<script type="text/javascript" src="abc.js">
</script>
</head>

<body>
<img id = "back"src = "bg.jpg">
<%@include file="Mymenu.jsp" %>

<div id="tab">
<center>
<form action="Regis.jsp" method="Post">
<table cellpadding="6" id="regtab">
<!-- <caption>Registration Form</caption> -->
<th colspan="2"style="font-family:Times New Roman;font-size:25px;">Registration Form</th>
<tr>
<td>Name</td> 
<td><input type ="text" placeholder="  Enter Name" class="B" name="n" required></td> 
</tr> 

<tr>
<td>Father Name</td> 
<td><input type ="text" placeholder="  Enter Father Name" class="B" name="fn" required></td> 
</tr> 

<tr>
<td>Mobile no.</td> 
<td><input type ="text"  placeholder="  Enter Mobile No." class="B" name="mn" required></td> 
</tr> 

<tr>
<td>E-mail</td> 
<td><input type ="Email" size ="20" placeholder="  Enter E-mail" class="B" name="em" required></td> 
</tr> 

<tr>
<td>Gender</td> 
<td><input type ="radio" value = "Male" name ="gender" size ="20"  class="B" checked>Male<input type ="radio" value = "Female" name ="gender" size ="20"  class="B">Female</td> 
</tr> 

<tr>
<td>D.O.B</td> 
<td><input type ="date" size ="30" name = "dob" class="B" style="color:black;" required></td> 
</tr> 

<tr>
<td >State</td> 
<td><select class="B" name="stt" >
 <option >Select</option>
 <option value="Andhra Pradesh">Andhra Pradesh</option>
  <option value="Arunachal Pradesh">Arunachal Pradesh</option>
  <option value="Assam">Assam</option>
  <option value="Bihar">Bihar</option>
  <option value="Chhattisgarh">Chhattisgarh</option>
  <option value="Goa">Goa</option>
  <option value="Gujarat">Gujarat</option>
  <option value="Haryana">Haryana</option>
  <option value="Himachal Pradesh">Himachal Pradesh</option>
  <option value="Jharkhand">Jharkhand</option>
  <option value="Karnataka">Karnataka</option>
  <option value="Kerala">Kerala</option>
  <option value="Madhya Pradesh">Madhya Pradesh</option>
  <option value="Maharashtra">Maharashtra</option>
  <option value="Manipur">Manipur</option>
  <option value="Meghalaya">Meghalaya</option>
  <option value="Mizoram">Mizoram</option>
  <option value="Nagaland">Nagaland</option>
  <option value="Odisha">Odisha</option>
  <option value="Punjab">Punjab</option>
  <option value="Rajasthan">Rajasthan</option>
  <option value="Sikkim">Sikkim</option>
  <option value="Tamil Nadu">Tamil Nadu</option>
  <option value="Telangana">Telangana</option>
  <option value="Tripura">Tripura</option>
  <option value="Uttar Pradesh">Uttar Pradesh</option>
  <option value="Uttarakhand">Uttarakhand</option>
  <option value="West Bengal">West Bengal</option>
  </select>
</td> 
</tr> 

<tr>
<td>City</td> 
<td><input type ="text"  placeholder="  Enter City" class="B" name="ct" required></td> 
</tr> 

<tr>
<td>Username</td> 
<td><input type ="text" placeholder="  Enter UserName" class="B"name="un" required></td> 
</tr> 

<tr>
<td>Password</td> 
<td><input type ="password" placeholder="  Enter Password" class="B" name="up" id ="t1" onkeyup="demo()" required></td> 
<td><font id="password"></font></td
</tr> 

<tr>
<th colspan="2"><input type = "submit" value = "Register" class = "A" name="register"></th> 
</tr> 

</table>
</form>
</center>
</div>
  <%
    String regisdemo=request.getParameter("register");
    if(regisdemo!=null)
    {
        String s1 = request.getParameter("n");  
String s2 = request.getParameter("fn");  
String s3 = request.getParameter("mn");  
String s4 = request.getParameter("em");  
String s5 = request.getParameter("dob");  
String s7 = request.getParameter("stt");  
String s6 = request.getParameter("ct");  
String s8 = request.getParameter("un");  
String s9 = request.getParameter("up");  
String s10 = request.getParameter("gender");  
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql:///Project?allowPublicKeyRetrieval=true&useSSL=false","root","root");
	Statement st = con.createStatement();
	String q = "insert into login values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"')";
	st.executeUpdate(q);
	response.sendRedirect("Login.jsp");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
    }
   %>
</body>
</html>