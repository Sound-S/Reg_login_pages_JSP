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

@WebServlet("/forgot_password_validation")
public class forgot_password_validation extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String Email_id = request.getParameter("email_id");
		
		
		
		try 
		{
			boolean email_result = JDBC.check_email_id(Email_id);
			
			request.setAttribute("Email_id", Email_id);
			
			  String subject = "OTP || Forgot Password";
			  String text_1 = "Your OTP for Password Change : ";
			
			if(email_result)
			{		
				String OTP_forgot = JDBC.OTP_gen_mail_sending(Email_id, subject, text_1);
				
				HttpSession session = request.getSession();
				session.setAttribute("Generated_forgot_otp", OTP_forgot);
				session.setAttribute("Email_id", Email_id);
				
				//System.out.println("middle  " + OTP_forgot);
				
				RequestDispatcher rd=request.getRequestDispatcher("forgot_password_otp.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				request.setAttribute("mail_err_message", "is not registered!");
				
				RequestDispatcher rd=request.getRequestDispatcher("forgot_password.jsp");
				rd.forward(request, response);
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
