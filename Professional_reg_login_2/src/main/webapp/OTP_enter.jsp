<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>OTP Verification</title>

<link rel="stylesheet" href="style.css" />
</head>
<body>
    <section class="container">
      <header>OTP Verification</header>
      
      <div class="container">
				<h6 class="text-danger">${otp_msg}</h6>
				
			</div>
      
      <form action="otp_cmp" method="post" class="form">
      
        <div class="input-box">
          <label>Enter OTP</label>
          <input type="text" name="entered_otp" placeholder="Enter OTP" required />
        </div>
        
        
        <div class="submit_button"> 
        <input type="submit" value="submit" class="inn"/>
        </div>
        
      </form>
    </section>
    
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