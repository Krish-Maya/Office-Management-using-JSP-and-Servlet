<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyProject</title>
<style >
div  
{

margin-left:250px;
margin-top:150px;
border:  2px solid black;
border-radius:20px;
height:  250px;
width: 50%;
text-align: center;
}
table
{
margin-left:150px;
cellpadding:5px;

}

body
{
margin:50px;
background-color:lightblue;
}
#log 
{
color: white;
background-color:gray;
}
h1
{
text-align: center;
}
</style>
<script type="text/javascript" src="code.js"></script>
<meta charset="ISO-8859-1">
<title>Myproject </title>
<script src="code.js"></script>
</head>
<body>
<div id ="log ">
<h1 >IFHRMS </h1>


<form action ="test" ></br>
<table cellpadding="10px">
<tr>
<td>User Id   :</td>
<td><input type="text" name ="uname" id ="uname"><span></span></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name ="pass" id ="pass"><span></span></td>
</tr>
<tr>
<td><input type="submit" value="login" id ="log" ></td><td><input type="button" value="cancel" id ="log" ></td></tr></table>

</form>


</div>
</body>
</html>