package Codes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/getting_reg_values")
public class reg_getting_values extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fullname = request.getParameter("fullname");
		String email_id = request.getParameter("email_id");
		long mobile_number = Long.parseLong(request.getParameter("mobile_number"));
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String address_line_1 = request.getParameter("address_line_1");
		String address_line_2 = request.getParameter("address_line_2");
		String country = request.getParameter("country");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		long pin_code = Long.parseLong(request.getParameter("pin_code"));
		
//		System.out.println(fullname);
//		System.out.println(email_id);
//		System.out.println(mobile_number);
//		System.out.println(dob);
//		System.out.println(gender);
//		System.out.println(address_line_1);
//		System.out.println(address_line_2);
//		System.out.println(country);
//		System.out.println(city);
//		System.out.println(state);
//		System.out.println(pin_code);
		
		try 
		{
		  boolean email_check = JDBC.check_email_id(email_id);
		  
		  if(email_check)
		  {
			 System.out.println("Email_id already exist!");
			 request.setAttribute("Err_msg", "Email_id already exist!");
			 request.getRequestDispatcher("index_register.jsp").forward(request, response);
			 
		  }
		  else
		  {
			  System.out.println("Email_id is not registered!");
			  
			  boolean insert_user_data = JDBC.insert_user_data(fullname, email_id, mobile_number, dob, gender, address_line_1, address_line_2, country, city, state, pin_code);
			  
			  if(insert_user_data)
			  {
				  System.out.println("User Registered Successfully!");
				  
				  String subject = "OTP || Account Registration";
				  String text_1 = "Your OTP for Account Registration : ";
				  
				  String OTP = JDBC.OTP_gen_mail_sending(email_id,subject,text_1);
				  
				  HttpSession session = request.getSession();
				  session.setAttribute("Generated_OTP", OTP);
				  session.setAttribute("Email_id", email_id);
				  
				  RequestDispatcher rd=request.getRequestDispatcher("OTP_enter.jsp");
				  rd.forward(request, response);
				  
				  System.out.println("OTP returned : " + OTP);  
			  }
			  else
			  {
				  System.out.println("Account not created!"); 
			  }
			  
			  
		  }
		  
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
