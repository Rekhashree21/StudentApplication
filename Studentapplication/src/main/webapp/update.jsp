<%@page import="com.student.dto.Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Information</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    form {
        width: 50%;
        margin: 2rem auto;
        background: white;
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    fieldset {
        border: none;
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    label {
        font-weight: bold;
        margin-bottom: 0.5rem;
        color: #333;
    }

    input[type="text"],
    input[type="tel"],
    input[type="email"] {
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
        font-size: 1rem;
    }

    input[type="text"]:focus,
    input[type="tel"]:focus,
    input[type="email"]:focus {
        outline: none;
        border-color: #0078d7;
    }

    button {
        padding: 0.7rem;
        background-color: #0078d7;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1rem;
    }

    button:hover {
        background-color: #005cb2;
    }

    .form-title {
        text-align: center;
        margin-bottom: 1rem;
        font-size: 1.5rem;
        color: #333;
    }
</style>
</head>
<body>
<%Student s=(Student)session.getAttribute("student"); %>
    <form action="update" method="post">
        <div class="form-title">Update Student Information</div>
         <% String success = (String) request.getAttribute("success"); 
           if (success != null) { %>
           <h1 style="color: green"><%= success %></h1>
        <% } %>
        
        <% String failure = (String) request.getAttribute("failure"); 
           if (failure != null) { %>
           <h1 style="color: red"><%= failure %></h1>
        <% } %>
        <fieldset>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%=s.getName()%>" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="<%=s.getPhone()%>" required>

            <label for="mail">Mail:</label>
            <input type="email" id="mail" name="mail" value="<%=s.getMail()%>" required>

            <label for="branch">Branch:</label>
            <input type="text" id="branch" name="branch" value="<%=s.getBranch()%>" required>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="<%=s.getLocation()%>" required>

            <button type="submit">Update Account</button>
            <a href="dashboard.jsp"><button type="button">Back</button></a>
        </fieldset>
    </form>
</body>
</html>
