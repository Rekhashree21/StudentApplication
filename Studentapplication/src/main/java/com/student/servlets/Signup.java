package com.student.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.student.dao.StudentDAO;
import com.student.dao.StudentDAOImpl;
import com.student.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Signup extends HttpServlet  {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
//collecting the data from user
String name =req.getParameter("name");
String phonenumber=req.getParameter("phone");
String mail=req.getParameter("mail");
String branch=req.getParameter("branch");
String location=req.getParameter("location");
String password=req.getParameter("password");
String confirmpassword=req.getParameter("confirmpassword");

//converting String to long
long phone=Long.parseLong(phonenumber);

//PrintWriter out=resp.getWriter();


//JDBC Implementation 
Student s=new Student();
StudentDAO sdao=new StudentDAOImpl();
if(password.equals(confirmpassword))
{
	s.setName(name);
	s.setPhone(phone);
	s.setMail(mail);
	s.setBranch(branch);
	s.setLocation(location);
	s.setPassword(password);
	
	boolean res=sdao.insertStudent(s);
	s=sdao.getStudent(mail, password);
	if(res == true)
	{
		req.setAttribute("success", "signup successful");
		RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
		rd.forward(req, resp);
		
		
		//out.println("<h1>data added successfully</h1>");
	}
	else {
		req.setAttribute("failure", "signup failed");
		RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
		rd.forward(req, resp);
		
		//out.println("<h1>failed to add</h1>");
	}
}
}
}
