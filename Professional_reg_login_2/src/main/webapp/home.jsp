<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<style>
*
{
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}
.backgnd
{
    background: rgb(222,55,255);
    background: linear-gradient(90deg, rgba(222,55,255,1) 0%, rgba(211,45,233,1) 52%, rgba(156,33,231,1) 98%);
    height: 100vh;
}

.inner_nav_1
{
    /*background-color: black;  need to remove atlast */
    height: 70px;
    margin: 0 auto;
    direction: rtl;
}

.inner_nav_2
{
    background-color: white;
    height: 35px;  
    width: 150px;
    border-radius: 5px;

    float: right;
    position: fixed;
    text-align: center;

    margin-top: 17px;
    margin-right: 80px;
}

.logout
{
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 20px;
    margin-top: 2px;
    
    border: none;
    background: none;
}

.main_
{
    padding-top: 100px;
}

.main_div
{
    /*background-color: white;*/
    /*padding-top: 100px;*/
    /*height: 200px;*/
    border-radius: 10px;
}

.div_1
{
    /*border: 2px solid black;*/
    height: 350px;
    /*background-color: black;*/
    border-radius: 10px;
}

.div_2
{
    /*border: 2px solid black;*/
    height: 200px;
    background-color: black;

    border-radius: 10px;
    height: 350px;
}

.div_dummy_gap
{
    background: rgb(222,55,255);
    /*background: linear-gradient(90deg, rgba(222,55,255,1) 0%, rgba(211,45,233,1) 52%, rgba(156,33,231,1) 98%);*/
   
    border-radius: 10px;
    opacity: 1;
}

.profile_img
{
    height: 100%;
    width: 100%;
}

.box_1
{
    padding-top: 10px;
}

.inner_heading_1
{
    padding-top: 20px;
    text-align: left;
}

.inner_heading_2
{
    text-align: left;
    padding-top: 10px;
    padding-bottom: 10px;
}


.inner_heading_3
{
    text-align: left;
    padding-top: 10px;
    padding-bottom: 5px;
}

.technologies_list
{
    padding-top: 10px;
    text-align: left;
}

.li_1
{
    padding-top: 7px;
    font-size: 16px;
    padding-bottom: 10px;
    font-size: 18px;
}

</style>


</head>
<body>

    <div class="container-fluid backgnd">   <!-- Background div container -->
       <div class="container-fluid inner_nav_1">   <!-- inner div_1 container -->

        <div class="container inner_nav_2">    <!-- inner div_2 container -->
            <!-- <h5 class="logout">Logout</h5> -->
                        
            <!-- Logout section (button) -->
            
            <form action="logout" method="post" >
            <input type="submit" value = "logout" class="logout">
            </form>
            
        </div>
       </div>

       <div class="container main_">
       <div class="container text-center main_div">
        <div class="row">
          <div class="col-sm-3 div_1">

          <img src="https://res.cloudinary.com/dbmqn7wlu/image/upload/v1687709765/images/clocmkc9ii8bv3lfh6fd.jpg"  class="profile_img img-thumbnail"> <!--  need to place the image link  -->

          </div>

          <div class="col-sm-1 div_dummy_gap"></div>

          <div class="col-sm-8 div_2">
            
            <div class="container box_1">
             <h3 class="text-white inner_heading_1">This project was done by <b>Soundar S</b></h3>
            </div>

            <div class="container">
                <h5 class="text-white inner_heading_2">Project details : </h5>
            </div>

            <div class="container">
                <h5 class="text-white inner_heading_3"><b>Title : </b> Registration and Login Pages</h5>
            </div>

            <div class="container technologies_list">

                <ul class="">
                    <li class="list-item text-white li_1"><b>Front-End : </b>   JSP, HTML, CSS, Bootstrap</li>
                    <li class="list-item text-white li_1"><b>Business Logic : </b>  Java, Servlet</li>
                    <li class="list-item text-white li_1"><b>Database : </b>   MySQL</li>
                  </ul>

            </div>
            
        </div>
        
      </div>
    </div>

    </div>
    </div>
    
    
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




