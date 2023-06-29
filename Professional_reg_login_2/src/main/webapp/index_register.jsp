<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<title>Registration</title>

<link rel="stylesheet" href="style.css" />
</head>
<body>
    <section class="container">
      <header>Registration Form</header>
      
      <div class="container">
				<h6 class="text-danger">${Err_msg}</h6>
				
			</div>
      
      <form action="getting_reg_values" method="post" class="form">
        <div class="input-box">
          <label>Full Name<span style="color:red;font-size: 18px;">*</span></label>
          <input type="text" name="fullname" placeholder="Enter full name" required />
        </div>
        <div class="input-box">
          <label>Email Address<span style="color:red;font-size: 18px;">*</span></label>
          <input type="text" name="email_id" placeholder="Enter email address" required />
        </div>
        <div class="column">
          <div class="input-box">
            <label>Mobile Number<span style="color:red;font-size: 18px;">*</span></label>
            <input type="number" name="mobile_number" placeholder="Enter phone number" required />
          </div>
          <div class="input-box">
            <label>Birth Date<span style="color:red;font-size: 18px;">*</span></label>
            <input type="date" name="dob" placeholder="Enter birth date" required />
          </div>
        </div>
        <div class="gender-box">
          <h3>Gender<span style="color:red;font-size: 18px;">*</span></h3>
          <div class="gender-option">
            <div class="gender">
              <input type="radio" id="check-male" name="gender" value="male" checked />
              <label for="check-male">Male</label>
            </div>
            <div class="gender">
              <input type="radio" id="check-female" name="gender" value="female" />
              <label for="check-female">Female</label>
            </div>
            <div class="gender">
              <input type="radio" id="check-other" name="gender" value="prefer_not_to_say" />
              <label for="check-other">Prefer not to say</label>
            </div>
          </div>
        </div>
        <div class="input-box address">
          <label>Address<span style="color:red;font-size: 18px;">*</span></label>
          <input type="text"  name="address_line_1" placeholder="Enter street address Line 1" required />
          <input type="text"  name="address_line_2" placeholder="Enter street address line 2" required />
          <div class="column">
            <div class="select-box">
              <select name="country">
                <option hidden>Country</option>
                <option>America</option>
                <option>Africa</option>
                <option>China</option>
                <option>Dubai</option>
                <option>India</option>
                <option>Japan</option>
                <option>Nepal</option>
                <option>Mangolia</option>
                <option>North Korea</option>
                <option>Russia</option>
                <option>South Korea</option>
                <option>Sri Lanka</option>
              </select>
            </div>
            <input type="text"  name="city" placeholder="Enter your city" required />
          </div>
          <div class="column">
            <input type="text" name="state" placeholder="Enter your state" required />
            <input type="number" name="pin_code" placeholder="Enter pincode" required />
          </div>
        </div>
        
        <div class="submit_button"> 
        <input type="submit" value="Submit" class="inn"/>
        </div>
        
        <div class="container"> 
      
        <div class="login_page_link"> 
      
        <a href="index_login.jsp" class="login_link text-dark">Already have an account? login</a>
      
        </div>
      
       </div>
        
      </form>
    </section>
    
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  </body>
</html>