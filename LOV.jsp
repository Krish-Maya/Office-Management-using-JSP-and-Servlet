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
text-align: center;

}
#tab1
{
border: 2px solid black;
border-collapse:collapse;
width:100%;
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
<td>Office Name </td><td> <input type="text" name ="idd" id ="idd"></td><td style="text-align:center">
<input type="submit" value="Search" id ="go"> </td></tr>


</table>
</form>

</br>
<table   id ="tab2" >
<tr> 
<th>TO Code</th>
<th>DDO Code </th>
<th> Office</th>
</tr>


<%



try {
	 int id =Integer.parseInt(request.getParameter("idd"));
	 String off= request.getParameter("off");
	 String post = request.getParameter("post");
	 
	 

ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3308/mydb","root","");
PreparedStatement ps=con.prepareStatement("select * from empdetail where TO_Code=?");
ps.setInt(1,id);
	
	 rs= ps.executeQuery();
	%>
	
<%
	while(rs.next())
{%>

	<tr>
	<td>
<%=rs.getInt("TO_Code")%></td>

	<td>
	 <%=rs.getString("DDO_Code")%>
	</td>
	<td>
	
	<%=rs.getString("Office")%></td>

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