package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pro1serv
 */
@WebServlet("/prcs1")
public class pro1serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pro1serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
PrintWriter write=response.getWriter();
		
		try {
			
			 String tno = request.getParameter("tno");
			 String tdate= request.getParameter("tdate");
			 String adesin = request.getParameter("adesin");
			 String aname = request.getParameter("aname");
			 String ono = request.getParameter("ono");
			 String odate= request.getParameter("odate");
			 String tres= request.getParameter("tres");
			 String ttype = request.getParameter("ttype");
			 String jdept= request.getParameter("jdept");
			 String joff= request.getParameter("joff");
			 String jcat= request.getParameter("jcat");
			 String jpost= request.getParameter("jpost");
			 String rauthdes= request.getParameter("rauthdes");
			 String rauthname= request.getParameter("rauthname");
			 String rrno= request.getParameter("rrno");
			 String rrdate= request.getParameter("rrdate");
			 String dor= request.getParameter("dor");
			 String dorAF = request.getParameter("dorAF");
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3308/mydb","root","");
			PreparedStatement ps=con.prepareStatement("insert into empdetail values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?");
			ps.setString(1,"tno");
			ps.setString(2,"tdate");
			ps.setString(3,"adesin");
			ps.setString(4,"aname");
			ps.setString(5,"ono");
			ps.setString(6,"odate");
			ps.setString(7,"tres");
			ps.setString(8,"ttype");
			ps.setString(9,"jdept");
			ps.setString(10,"joff");
			ps.setString(11,"jcat");
			
			ps.setString(12,"jpost");
			ps.setString(13,"rauthdes");
			ps.setString(14,"rauthname");
			ps.setString(15,"rrno");
			ps.setString(16,"rrdate");
			ps.setString(17,"dor");
			ps.setString(18,"dorAF");
		 	
		 	ResultSet rs= ps.executeQuery();
		 	
		 	if  (rs.next())
			{
				
				 
				write.print("hello" +pas);

			}
			else 
			{
				
				write.print("wrong error");
			}
			
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(Exception e)
		{
			write.print("null pointer");
		}

		
		
		
		
	}

}
