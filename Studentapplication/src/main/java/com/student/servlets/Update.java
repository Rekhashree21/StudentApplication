package com.student.servlets;

import java.io.IOException;

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

@WebServlet("/update")
public class Update extends HttpServlet
{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session=req.getSession(false);
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));//converting string to long
		String mailid=req.getParameter("mail");
		String branch=req.getParameter("branch");
		String locaton=req.getParameter("location");
		
		StudentDAO sdao=new StudentDAOImpl();
		Student s=(Student)session.getAttribute("student");//downcasting
		
		if(s!=null)
		{
			s.setName(name);
			s.setPhone(phone);
			s.setMail(mailid);
			s.setBranch(branch);
			s.setLocation(locaton);
			boolean res1=sdao.updateStudent(s);
			if(res1)
			{
				req.setAttribute("success", "update Successful");
				RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
				rd.forward(req, resp);
			}
			else
			{
				req.setAttribute("failure", "update failed");
				RequestDispatcher rd=req.getRequestDispatcher("update.jsp");
				rd.forward(req, resp);
			}
		}		
	}
}
