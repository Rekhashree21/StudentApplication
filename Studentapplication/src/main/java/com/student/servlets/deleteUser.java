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

@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	StudentDAO sdao = new StudentDAOImpl(); 
	
	HttpSession hs = req.getSession(false);
	Student admin = (Student)hs.getAttribute("student");
	int aid = admin.getId();
	
	String id = req.getParameter("id");
	int sid = Integer.parseInt(id);
	
	if(aid!=sid) {
		Student stoDelete = new Student();
		stoDelete.setId(sid);
		
		boolean res = sdao.deleteStudent(stoDelete);
		if(res) {
			req.setAttribute("delSuccess","User Deleted Succesfully!");
			RequestDispatcher rd = req.getRequestDispatcher("viewUser.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("delFailure", "Failed to Delete the User!!");
			RequestDispatcher rd = req.getRequestDispatcher("viewUser.jsp");
			rd.forward(req, resp);
		}
	}
	else {
		req.setAttribute("adminDelete", "Admin Data cannot be deleted!!");
		RequestDispatcher rd = req.getRequestDispatcher("viewUser.jsp");
		rd.forward(req, resp);
	}
}
}
