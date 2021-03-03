<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>Process2</title>
<style>
*
{
margin:0px;
padding:0px;
}
 table ,tr,th,td
{

border-collapse: collapse;
padding:3px; margin:20px; 
border-spacing:10px;
}
#tab3
{
margin-left:100px;

}
#tab1
{

margin-left:300px;

}
#tab2
{

margin-left: 100px;
}
#nxt
{
margin-left:1150px;
padding:5px;
}
#nxt1
{
padding:5px;
}
</style>
</head>
<body style="background-color:lightgray;">


<h1> welcome</h1>

<%= session.getAttribute("eid")%>

<div style="display:inline-block;  "  >
<h2 style="display:inline-block;  " > Employee Details</h2> <input type="button" value ="Review" id="nxt" style="display:inline-block; ">
<input type="button" value ="Cancel" id="nxt1">
</div>
<hr><hr>
<div>
<%

try {
	int id=Integer.parseInt(request.getParameter("idd"));
	session.setAttribute("uid", id);
String connectionURL = "jdbc:mysql://localhost:3308/mydb";
Connection connection = null;

ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL, "root", "");
PreparedStatement ps=connection.prepareStatement("select * from empdetail where Employee_id=?;");
ps.setInt(1,id);
rs = ps.executeQuery();
%>

<%
while (rs.next()) {
%>
<table cellpadding="100px" style="display:inline-block; float:left; text-align:right; "  id="tab1">

<tr><td>Employee Id </td><td style="text-align:left;"><%=rs.getInt("Employee_id")%></td></tr>
<tr><td>Office </td><td style="text-align:left;"><%=rs.getString("Office")%></td></tr>
<tr><td>Post</td><td style="text-align:left;"><%=rs.getString("Post")%></td></tr>
<tr><td>Empolyee Type </td><td style="text-align:left;"><%=rs.getString("catagory")%></td></tr>
<tr><td>Retirement Date</td><td style="text-align:left;"><%=rs.getString("Retirement_Date")%></td></tr>
</table> 

<table style="display:inline-block; text-align:right;" id="tab2">
<tr><td>Employee Name</td><td style="text-align:left;"><%=rs.getString("Employee_Name")%></td></tr>
<tr><td>Category</td><td style="text-align:left;"><%=rs.getString("catagory")%></td></tr>
<tr><td>Joining Date </td><td style="text-align:left;"><%=rs.getString("Joining_Date")%></td></tr>
<tr><td>Grade</td><td style="text-align:left;"><%=rs.getString("Grade")%></td></tr>
<tr><td>Date Of Birth</td><td style="text-align:left;"><%=rs.getString("Date_Of_Birth")%></td></tr>
</table>
<% } %>
<%
rs.close();
ps.close();
connection.close();
} catch (Exception ex) {
%></div>


<%
out.println("Unable to connect to database."+ex);
}
%><hr>

<hr><form action="prcs2.jsp" >
<table style=" text-align:right; "  id ="tab3">

<tr style= "text-align:center; background-color:lightblue;"><th colspan="2" >Transfer & Relieving Details </th></tr>
<tr><td>Transaction Number </td><td><input type="text" name="tno" ></td></tr>
<tr><td>Transaction Date </td><td><input type="text"  name="tdate"></td></tr>
<tr><td>Transferring Authority Designation </td><td><input type="text" name="adesin"></td></tr>
<tr><td>Transferring Authority Name </td><td><input type="text" name="aname" ></td></tr>
<tr><td>Transfer Order/G.O. Reference Number  </td><td><input type="text" name ="ono"></td></tr>
<tr><td>Transfer Order/G.O. Reference Date </td><td><input type="text" name="odate" ></td></tr>
<tr><td>Transfer Reason </td><td><select name="tres">
<option>&nbsp </option>
<option> Transfer By Admin</option>
<option> Transfer By Request</option>
</select></td></tr>
<tr><td>Transfer Type </td><td><select name="ttype">
<option>&nbsp </option>
<option> Inside department</option>
<option> Outside department </option>
</select></td></tr>
<tr><td>Joinging Department </td><td><input type="text" name="jdept" ></td></tr>

<tr><td>Joining Office</td><td><input type="text"  name="joff"></td><td><button onclick="myfun()">Search</button>
<script type="text/javascript">
function myfun(){
	window.open("LOV.jsp","mkmk","height=500,width=500");
}
</script>



</td></tr>
<tr><td>Joining Category</td><td><input type="text" name="jcat"></td></tr>
<tr><td>Joining Post</td><td><input type="text"  name ="jpost"></td></tr>
<tr><td>Relieving Authority Designation</td><td><input type="text" name="rauthdes"></td></tr>
<tr><td>Relieving Authority Name </td><td><input type="text" name="rauthname" ></td></tr>
<tr><td>Relieving Order/G.O. Reference Number</td><td><input type="text" name="rrno" ></td></tr>
<tr><td>Relieving Order/G.O. Reference Date </td><td><input type="text" name="rrdate"></td></tr>
<tr><td>Date Of Relief</td><td><input type="text"  name="dor"></td></tr>
<tr><td>Date Of Relief FN/AN </td><td><select name="dorAF">
<option>&nbsp </option>
<option> FN</option>
<option> AN</option>
</select></td></tr>

</table>
<input type="submit" value ="Review" id="nxt" style="display:inline-block; ">
<input type="button" value ="Cancel" id="nxt1">
</form>

</body>
</html>