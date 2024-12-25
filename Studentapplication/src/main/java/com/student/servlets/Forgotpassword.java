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

@WebServlet("/forgotpassword")
public class Forgotpassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//creating a session object
		HttpSession session=req.getSession();
		
		
		//collect data from user
		String phonenumber = req.getParameter("phone");
		String mail = req.getParameter("email");
		String password = req.getParameter("new_password");
		String confirmpassword = req.getParameter("confirm_password");
		
		//parse phone number
		long phone = Long.parseLong(phonenumber);
		
		//JDBC implementation
		Student s=new Student();
		StudentDAO sdao = new StudentDAOImpl();
		s=(Student)session.getAttribute("student");
		//PrintWriter out = resp.getWriter();
		//Student s=sdao.getStudent(phone,mail);
		
		
		if(s!=null && phone==s.getPhone() && mail.equals(s.getMail()) && password.equals(confirmpassword)){
		//	if(password.trim().equals(confirmpassword.trim())) {
				
			    s.setPassword(password);
			    
				boolean res = sdao.updateStudent(s);
				/*if(res) {
					out.println("<h1>Password Changed Successfully </h1>");
				}
				else {
					out.println("<h1>Password Update Failed</h1>");
				}
			}
			else {
				out.println("<h1>Password Mismatch</h1>");
			}
		}
		else {
			out.println("<h1>Invalid Phone Number or Mail Id</h1>");
		}*/
				
				if(res) {
			req.setAttribute("success", "Pin updated successfulyl");
			RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
			rd.forward(req, resp);
			
		}
		else {
			req.setAttribute("failure", "Pin updated failed");
			RequestDispatcher rd=req.getRequestDispatcher("forgotpassword.jsp");
			rd.forward(req, resp);
		}
	
	}

}
}