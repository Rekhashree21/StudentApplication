<%@page import="com.student.dto.Student"%>
<%@page import="com.student.dao.StudentDAOImpl" %>
<%@page import="com.student.dao.StudentDAO" %>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.student.dto.Student"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view users</title>
    <style>
       * {
    margin: 0px;
    padding: 0px;
}
body {
    background-color: #f4f4f4;
    height: 100vh;
}
h2{
    margin: 30px;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin: 20px;
}
th, td {
    border: 1px solid #ddd;
    text-align: left;
    padding: 10px;
}
th {
    background-color: #f4f4f4;
}

.button {
    padding: 8px 10px;
    width: 100px;
    font-size: 15px;
    border-radius: 5px;
    border: none;
    margin : 8px;
    margin-bottom: 20px;
    background-color: black;
    color: white;
    cursor: pointer;
    text-align: center;
}
       
    </style>
</head>
<body>
    <div class="tables">
        <h2 style="text-align: center;">USER DETAILS</h2>
        
        <table>
            <thead>
                <tr>
                <%String delSuccess = (String)request.getAttribute("delSuccess");
                  if(delSuccess!=null){%>
                  <h3 style="text-align: center;"><%=delSuccess %></h3>
                  <%}%>
                  
                <%String delFailure = (String)request.getAttribute("delFailure");
                  if(delFailure!=null){%>
                  <h3 style="text-align: center;"><%=delFailure %></h3>
                  <%}%>
                
                 <%String adminDelete = (String)request.getAttribute("adminDelete");
                  if(adminDelete!=null){%>
                  <h3 style="text-align: center;"><%=adminDelete %></h3>
                  <%}%>
                
                
                  
                    <th>ID</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Mail ID</th>
                    <th>Branch</th>
                    <th>Location</th>
                    <th>Delete User</th>
                </tr>
            </thead>
            

            <tbody>
                  <%StudentDAO sdao = new StudentDAOImpl();
                  ArrayList<Student> students = (ArrayList<Student>) sdao.getStudent();
		           		  ListIterator<Student> itr = students.listIterator();
		          		  while(itr.hasNext()){
		             	  Student s = itr.next();%>
		                <tr>
		                    <td><%=s.getId()%></td>
		                    <td><%=s.getName()%></td>
		                    <td><%=s.getPhone()%></td>
		                    <td><%=s.getMail()%></td>
		                    <td><%=s.getBranch()%></td>
		                    <td><%=s.getLocation()%></td> 
		                    <td><form action="deleteUser" method="post">
		                        <input type="hidden" name="id" value="<%=s.getId()%>">
		                        <input class="button"  type="submit" value="Delete">
		                         
		                       </form>
		                    </td>
						</tr>
		              <%}%>
            </tbody>
            
            
        </table>
    </div>
</body>
</html>