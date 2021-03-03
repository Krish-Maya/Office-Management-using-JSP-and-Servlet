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
<%=session.getAttribute("eid")%>
<% Object ss=session.getAttribute("uid");%>


<div style="display:inline-block;  "  >
<h2 style="display:inline-block;  " > Employee Details</h2><input type="button" value ="Review" id="nxt" style="display:inline-block; ">
<input type="button" value ="Cancel" id="nxt1">
</div>
<hr><hr>
<div>
<%
try {
	int id=1234;

String connectionURL = "jdbc:mysql://localhost:3308/mydb";
Connection connection = null;

ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL, "root", "");
PreparedStatement ps=connection.prepareStatement("select * from empdetail where Employee_id=?;");
ps.setObject(1,ss);
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
<form >

<% String tn= request.getParameter("tno"); 
int td=Integer.parseInt(request.getParameter("tdate"));
String ad= request.getParameter("adesin");
String an= request.getParameter("aname");
String on= request.getParameter("ono");
String od= request.getParameter("odate");
String tr= request.getParameter("tres");
String tt= request.getParameter("ttype");
String jd= request.getParameter("jdept");
String jo= request.getParameter("joff");
String jc= request.getParameter("jcat");
String jp= request.getParameter("jpost");
String rad= request.getParameter("rauthdes");
String ran= request.getParameter("rauthname");
String rrn= request.getParameter("rrno");
String rd= request.getParameter("rrdate");
String dor= request.getParameter("dor");
String doraf= request.getParameter("dorAF");%>


<hr>
<table style=" text-align:right; "  id ="tab3">

<tr style= "text-align:center; background-color:lightblue;"><th colspan="2" >Transfer & Relieving Details </th></tr>
<tr><td>Transaction Number </td><td>
<%=tn%></td></tr>
<tr><td>Transaction Date </td><td><input type="text" value=<%=td%> name="ttt"></td></tr>
<tr><td>Transferring Authority Designation </td><td><%=ad%></td></tr>
<tr><td>Transferring Authority Name </td><td><%=an%></td></tr>
<tr><td>Transfer Order/G.O. Reference Number  </td><td><%=on%></td></tr>
<tr><td>Transfer Order/G.O. Reference Date </td><td><%=od%></td></tr>
<tr><td>Transfer Reason </td><td><%=tr%></td></tr>
<tr><td>Transfer Type </td><td><%=tt%></td></tr>
<tr><td>Joinging Department </td><td><%=jd%></td></tr>

<tr><td>Joining Office</td><td><%=jo%></td></tr>
<tr><td>Joining Category</td><td><%=jc%></td></tr>
<tr><td>Joining Post</td><td><%=jp%></td></tr>
<tr><td>Relieving Authority Designation</td><td><%=rad%></td></tr>
<tr><td>Relieving Authority Name </td><td><%=ran%></td></tr>
<tr><td>Relieving Order/G.O. Reference Number</td><td><%=rrn%></td></tr>
<tr><td>Relieving Order/G.O. Reference Date </td><td><%=rd%></td></tr>
<tr><td>Date Of Relief</td><td><%=dor%></td></tr>
<tr><td>Date Of Relief FN/AN </td><td><%=doraf%></td></tr>

</table>
<input type="submit" value ="Submit" id="nxt" style="display:inline-block; ">
<input type="button" value ="Cancel" id="nxt1">
</form>

<%



try {
	 
	 
	 int idd =55555;
	 String ts="mkmk";


Class.forName("com.mysql.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3308/mydb","root","");
PreparedStatement ps=con.prepareStatement("insert into temp(Transaction_Number,Transfer_Reason,Employee_id) values(?,?,?)");
ps.setInt(3,td);
ps.setString(2,ts);
ps.setInt(1,idd);
	
	boolean bb=ps.executeUpdate() >0;
	  
if (bb)
{
	
	out.print("inserted");
	
}else
{
	out.print("not insert");
}
ps.close();
con.close();

} catch (Exception ex) {

out.println(ex);
}

%>
<hr>
<table>
<tr><td>Approval Group</td><td><input type ="button" value ="select"></td></tr> 
</table>

</body>
</html>