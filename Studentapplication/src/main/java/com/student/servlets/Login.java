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
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class Login extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {

//creating a session object
	HttpSession session=req.getSession();
	
	
//collect the data from the user
String mail=req.getParameter("email");
String password=req.getParameter("password");
//PrintWriter out=resp.getWriter();

//jdbc implementation
StudentDAO sdao=new StudentDAOImpl();
Student s=sdao.getStudent(mail, password);
if(s!=null)
{
  /* resp.sendRedirect("success.html");return type is void
   this method is used to redirect the servlet to the next page or next resource
   the next resource can be either html,jsp or another servlet
   syntax: public void resp.sendRedirect("url/next resource");*/
   session.setAttribute("student", s);
   RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
   rd.forward(req, resp);
   
}
else
{
	//resp.sendRedirect("failure.html");
	 req.setAttribute("failure", "failed to login");
	   RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
	   rd.forward(req, resp);
		}
		}
		}