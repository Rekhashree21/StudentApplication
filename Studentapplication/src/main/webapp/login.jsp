<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Pentagon Space</title>
  <style>
body {
  font-family: Arial, sans-serif;
  background-color: #f8f9fa;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.login-container {
  background-color: #fff;
  padding: 40px 30px;
  width: 100%;
  max-width: 400px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  text-align: center;
}

h1 {
  font-size: 32px;
  color: #333;
  margin-bottom: 10px;
}

h2 {
  font-size: 24px;
  color: #555;
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 20px;
  text-align: left;
}

label {
  display: block;
  font-size: 16px;
  color: #333;
  margin-bottom: 8px;
}

input[type="email"],
input[type="password"] {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 12px;
  font-size: 18px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
}

button:hover {
  background-color: #0056b3;
}

.extra-links {
  margin-top: 20px;
}

.extra-links a {
  color: #007bff;
  text-decoration: none;
  font-size: 14px;
}

.extra-links a:hover {
  text-decoration: underline;
}

.extra-links p {
  font-size: 14px;
  color: #555;
  margin-top: 10px;
}
  
  </style>
</head>
<body>
  <div class="login-container">
    <h1>Pentagon Space</h1>
    <h2>Login</h2>
    <form action="login" method="POST">
    
    <%String success=(String)request.getAttribute("success");
    if(success!=null){%>
    <h3 class="success"><%=success%></h3>
    <%}%>
    
    <%String failure=(String)session.getAttribute("failure");
    if(failure!=null){%>
    <h3 class="success"><%=failure %></h3>
    <%}%>
    
      <div class="form-group">
        <label for="email">Enter your Email ID:</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="password">Enter your Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <button type="submit">Login</button>
      <div class="extra-links">
        <a href="forgotpassword.jsp">Forgot PIN?</a>
        <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
      </div> 
    </form>
  </div>
</body>
</html>
