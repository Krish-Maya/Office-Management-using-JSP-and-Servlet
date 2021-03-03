<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %> 
<html>
<head>
<title>MyProject</title>
<style >
div  
{
margin-top:1px;
background-color:lightblue;
border:  2px dotted black;
height:  300px;
width: 75%;
text-align: center;

}
#tab1
{
margin-top:150px;
margin-left:450px;
border:1px dotted black;
border-collapse:collapse;

}

body
{
background-color:lightgray;

}
#log 
{
color: red;
background-color:lightgreen;
}
p
{
margin-left:20px;
display:inline ;


}

 th ,td {
 
  border: 1px solid black;
}

#tab2 
{
border: 2px solid black;
border-collapse:collapse;
width:100%;
}

</style>

<meta charset="ISO-8859-1">

</head>
<body>
<form >

<h1>Welcome <%= session.getAttribute("eid")%></h1>
<table id="tab1"  cellpadding="10px" >
<tr>
<td>

Employee Id :</td><td> <input type="text" name ="idd" id ="idd"></td> </tr>
<tr>
<td>Employee Name : </td><td><input type="text" name ="off" id ="off"> </td>
</tr><tr>
<td>Post :</td><td><input type="text"  name="post" ></td></tr>
<tr><td style="text-align:center">
<input type="submit" value="Go" id ="go"> </td><td style="text-align:center">
<input type="button" value="Clear" ></td></tr>


</table>
</form>

</br>
<table   id ="tab2" >
<tr> 
<th>ID</th>
<th>NAME  </th>
<th> POST</th>
<th> Category</th>
<th></th>
</tr>


<%



try {
	 int id =Integer.parseInt(request.getParameter("idd"));
	 String off= request.getParameter("off");
	 String post = request.getParameter("post");
	 
	 

ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3308/mydb","root","");
PreparedStatement ps=con.prepareStatement("select * from empdetail where Employee_id=?");
ps.setInt(1,id);
	
	 rs= ps.executeQuery();
	%>
	
<%
	while(rs.next())
{%>

	<tr>
	<td>
<%=rs.getInt("Employee_id")%></td>

	<td>
	 <%=rs.getString("Employee_Name")%>
	</td>
	<td>
	
	<%=rs.getString("Post")%></td>
	<td><%=rs.getString("catagory")%></td>
<td><a href="NewFile.jsp?idd=<%=id%>">action</a></td>
	</tr>
	<% }%>
	
	<%
	String nam= request.getParameter("name");
	
%><%
rs.close();
ps.close();
con.close();

} catch (Exception ex) {

out.println(ex);
}

%>

</table>
</form>
</body>
</html>