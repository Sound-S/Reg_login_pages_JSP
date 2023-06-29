<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>Set password</title>

<style>

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body
{
min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background: rgb(130, 106, 251);
}

.back
{
  position: relative;
  max-width: 600px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
}

.header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}

.header1 {
  font-size: 1.2rem;
  color: #333;
  font-weight: 500;
  text-align: center;
  padding: 20px;
}

.form .input-box {
  width: 100%;
  margin-top: 20px;
}

.container .form 
{
  margin-top: 30px;
}

.input-box label {
  color: #333;
}

.form :where(.input-box input, .select-box) {
  position: relative;
  height: 40px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}

.input-box input:focus 
{
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.submit_button /* submit button */
{
  height: 50px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 400;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: rgb(130, 106, 251);
  border-radius:5px;
}

.inn
{
	text-decoration: none;
	border: none;
	background-color: rgb(130, 106, 251);
	cursor: pointer;
	font-size: 20px;
	color:white;
	margin: 12px 204px;
	
}

.show_pass
{
padding-top:15px;
}




</style>

</head>
<body>

    <section class="container back">
      <header class="header">Create new password</header>
      
      <div class="container">
      <h5 class="header1"> We'll ask for this password whenever you login </h5>
      </div>
      
      <div class="container">
				<h6 class="text-danger">${password_forgot_not_set}</h6>
				
			</div>
      
      <div class="container">
      
      <form action="setting_new_forgot_password" method="post" class="form" id="myForm">
      
      <div class="input-box">
          <label>New password<span style="color:red;font-size: 18px;">*</span></label>
          <input type="password" name="new_password" class="form-control" placeholder="Enter new password" id="myInput" required />
        </div>
        
        <div class="input-box">
          <label>Confirm password<span style="color:red;font-size: 18px;">*</span></label>
          <input type="password" name="confirm_password" class="form-control" placeholder="Enter confirm password" id="myInput2" required />
          
          <small id="confirmPassword-feedback" style="color: red;"></small>
        </div>
        
        <div class="form-outline show_pass mb-4">
      <input type="checkbox" onclick="myFunction()"> Show Password 
      </div>
        
        <div class="submit_button"> 
        <input type="submit" value="Save Changes" class="inn"/>
        </div>

      </form>
      
      </div>
     
    </section>
    
    <script>
    
    const form = document.getElementById("myForm");
    const password = form.new_password;
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>