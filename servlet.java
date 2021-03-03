  package com;
import java.sql.*;

import java.util.*;
import java.lang.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;


@WebServlet("/test")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		PrintWriter write=response.getWriter();
		
		try {
			
			 int  name = Integer.parseInt(request.getParameter("uname"));
			 String pass = request.getParameter("pass");
			 HttpSession ss=request.getSession();
			 
			 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3308/mydb","root","");
			PreparedStatement ps=con.prepareStatement("select id,pass,Employee_Name from login left join empdetail on Employee_id=id where id=? and pass=?;");
			ps.setInt(1,name);
		 	ps.setString(2,pass);
		 	ResultSet rs= ps.executeQuery();
		 	
		 	if (rs.next())
			{
		 		String nam=rs.getString("Employee_Name");
		 		ss.setAttribute("eid", nam);
			response.sendRedirect("hom.jsp");
			
			
				
			}
		 	else
		 	{
		 		write.println("<html><head>mkmkmk</head><body><h1>wrong user details</h1></body></html>");
		 	}
			
			} 
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		write.closse();
	
}
}
		


