<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup - Pentagon Space</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .container {
      width: 100%;
      max-width: 600px;
      margin: 50px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
      font-size: 32px;
    }

    h2 {
      text-align: center;
      color: #666;
      font-size: 24px;
      margin-bottom: 20px;
    }
    
    .success{
    color:green;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-size: 16px;
      color: #333;
      margin-bottom: 8px;
    }

    input[type="text"], input[type="password"] {
      width: 100%;
      padding: 12px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-bottom: 10px;
    }

    button {
      width: 100%;
      padding: 14px;
      background-color: #5cb85c;
      color: white;
      font-size: 18px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #4cae4c;
    }

    .login-link {
      text-align: center;
      margin-top: 20px;
    }

    .login-link a {
      color: #007bff;
      text-decoration: none;
      font-size: 16px;
    }

    .login-link a:hover {
      text-decoration: underline;
    }

  </style>
</head>
<body>

  <div class="container">
    <h1>Pentagon Space</h1>
    <h2>Application Form</h2>
    <form action="signup" method="POST">
    
    <%String success=(String)request.getAttribute("success");
    if(success!=null){%>
    <h3 class="success"><%=success %></h3>
    <%}%>
    
    
    <%String failure=(String)request.getAttribute("failure");
    if(failure!=null){%>
    <h3 class="success"><%=failure %></h3>
    <%}%>
    
      <div class="form-group">
        <label for="name">Enter the Name:</label>
        <input type="text" name="name" id="name" required>
      </div>

      <div class="form-group">
        <label for="phone">Enter the Phone Number:</label>
        <input type="text" name="phone" id="phone" required>
      </div>

      <div class="form-group">
        <label for="mail">Enter the Mail ID:</label>
        <input type="text" name="mail" id="mail" required>
      </div>

      <div class="form-group">
          Select Branch<select name="branch">
          <option>CSE</option>
          <option>ISE</option>
          <option>ECE</option>
          <option>ME</option> 
          </select>
          </div>
             
      
      <div class="form-group">
        <label for="location">Enter the Location:</label>
        <input type="text" name="location" id="location" required>
      </div>

      <div class="form-group">
        <label for="password">Enter the Password:</label>
        <input type="password" name="password" id="password" required>
      </div>

      <div class="form-group">
        <label for="confirm_password">Confirm the Password:</label>
        <input type="password" name="confirmpassword" id="confirmpassword" required>
      </div>

      <button type="submit">Create Account</button>

      <div class="login-link">
        <h3>Already have an account?</h3>
        <a href=login.html>Login</a>
      </div>

    </form>
  </div>

</body>
</html>
    