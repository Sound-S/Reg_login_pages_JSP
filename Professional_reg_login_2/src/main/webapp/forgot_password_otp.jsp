<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>Enter OTP</title>

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
	margin: 12px 220px;
	
}




</style>

</head>
<body>

    <section class="container back">
      <header class="header">Verification required</header>
      
      <div class="container" style="padding-top:16px;text-align:center;">
				<h6 class="text-danger">${OTP_err_msg}</h6>
				
			</div>
      
      <div class="container">
      <h5 class="header1"> To continue, complete this verification step. We've sent an OTP to the email "". Please enter it below to complete the verification. </h5>
      </div>
      
      <div class="container">
      
      <form action="forgot_password_otp" method="post" class="form">
      
      <div class="input-box">
          <label>Enter OTP<span style="color:red;font-size: 18px;">*</span></label>
          <input type="number" name="entered_forgot_otp" placeholder="Enter OTP" required />
        </div>
        
        <div class="submit_button"> 
        <input type="submit" value="Submit" class="inn"/>
        </div>

      </form>
      
      </div>
     
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