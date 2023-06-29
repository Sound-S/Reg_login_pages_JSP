<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />


<title>Password</title>

<link rel="stylesheet" href="style.css" />



<style>

.show_pass
{
padding-top:15px;
}

</style>
</head>
<body>
    <section class="container">
    
      <header>Create new password</header>
      
      <form action="password_set" method="post" class="form" id="myForm">
        <div class="input-box">
          <label>Password</label>
          <input type="password" name="password" placeholder="Enter new password" id="myInput" required />
        </div>
        <div class="input-box">
          <label>Confirm Password</label>
          <input type="password" name="confirm_password" placeholder="Enter confirm password" id="myInput2" required />
          
          <small id="confirmPassword-feedback" style="color: red;"></small>
          
        </div>
        
        <div class="form-outline show_pass mb-4">
      <input type="checkbox" onclick="myFunction()"> Show Password 
      </div>
        
        
        <div class="submit_button"> 
        <input type="submit" value="submit" class="inn"/>
        </div>
        
      </form>
    </section>
    
    <script>
    
    const form = document.getElementById("myForm");
    const password = form.password;
    const confirmPassword = form.confirm_password;
    const feedback = document.getElementById("confirmPassword-feedback");
    let isPasswordMatch = false;

    confirmPassword.addEventListener("input", () => {
      if (password.value != confirmPassword.value) {
        feedback.innerHTML = "Password did not match!";
        isPasswordMatch = false;
      } else {
        feedback.innerHTML = "";
        isPasswordMatch = true;
      }
    });
           
      function myFunction() {
		  var x = document.getElementById("myInput");
		  var y = document.getElementById("myInput2");
		  if (x.type === "password" && y.type === "password") 
		  {
		    x.type = "text";
		    y.type = "text";
		  } 
		  else 
		  {
		    x.type = "password";
		    y.type = "password";
		  }
		};
		
    </script>
    
    
    <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1

response.setHeader("pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //proxies

if (session.getAttribute("Email_id") == null)

{

	response.sendRedirect("index_register.jsp");

}
%>
    
    
    
   
   
  </body>
</html>