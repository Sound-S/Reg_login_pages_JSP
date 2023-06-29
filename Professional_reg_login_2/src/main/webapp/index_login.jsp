<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>Login</title>

<link rel="stylesheet" href="style.css" />

<style>

.show_pass
{
padding-top:15px;
}

#forgot_password
{
padding-top:5px;
}

</style>
</head>
<body>
    <section class="container">
      <header>Login Form</header>
      
      <div class="container">
				<h6 class="text-danger">${password_Err_msg}</h6>
				<h6 class="text-danger">${email_Err_msg}</h6>
	  </div>
				
			
      
      
      <form action="login_values" method="post" class="form">
        <div class="input-box">
          <label>Email-Id<span style="color:red;font-size: 18px;">*</span></label>
          <input type="email" name="email_id" placeholder="Enter your email" required />
        </div>
        <div class="input-box">
          <label>Password<span style="color:red;font-size: 18px;">*</span></label>
          <input type="password" name="password" id="myInput" placeholder="Enter your password" required />
        </div>
        
        <div class="form-outline show_pass mb-4">
        <input type="checkbox" onclick="myFunction()"> Show Password 
        </div>
        
        <div class="container" id="forgot_password"> 
        <a href="forgot_password.jsp" class="" style="text-decoration:none;">Forgot password?</a>
        </div>
        
       
        <div class="submit_button"> 
        <input type="submit" value="Login" class="inn"/>
        </div>
        
        <div class="container"> 
      
        <div class="login_page_link"> 
      
        <a href="index_register.jsp" class="login_link text-dark">Don't have an account? Register</a>
      
        </div>
      
       </div>
        
      </form>
      
      
    </section>
    
    <script>
    
    function myFunction() {
		  var x = document.getElementById("myInput");
		  
		  if (x.type === "password") 
		  {
		    x.type = "text";
		  } 
		  else 
		  {
		    x.type = "password"; 
		  }
		};
    
    
    </script>
    
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>