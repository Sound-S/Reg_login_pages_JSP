package Codes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/forgot_password_otp")
public class forgot_otp_cmp extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
		String forgot_otp_entered = request.getParameter("entered_forgot_otp");
		String generated_forgot_otp = (String) session.getAttribute("Generated_forgot_otp");
		
//		System.out.println("forgot_otp_entered " + forgot_otp_entered);
//		System.out.println(" generated_forgot_otp" + generated_forgot_otp);
		
		if(forgot_otp_entered.equals(generated_forgot_otp))
		{
			
			RequestDispatcher rd=request.getRequestDispatcher("Set_new_password.jsp");
			rd.forward(request, response);
			
		}
		else
		{
			
			request.setAttribute("OTP_err_msg", "Please enter Valid OTP!");
			RequestDispatcher rd=request.getRequestDispatcher("forgot_password_otp.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		
	}

}
