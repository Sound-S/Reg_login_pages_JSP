package Codes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/otp_cmp")
public class OTP_cmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
		  
		String Entered_otp = request.getParameter("entered_otp");
		String Generated_otp = (String) session.getAttribute("Generated_OTP");
		
		System.out.println("Entered_otp   " + Entered_otp);
		System.out.println("Generated_otp   " + Generated_otp);
		
		if(Entered_otp.equals(Generated_otp))
		{
			RequestDispatcher rd=request.getRequestDispatcher("Password.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("otp_msg", "OTP not match!");
			request.getRequestDispatcher("OTP_enter.jsp").forward(request, response);
			
			
		}
		
		
		
	}

}
