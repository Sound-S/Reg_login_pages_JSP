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

@WebServlet("/setting_new_forgot_password")
public class setting_forgot_password extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//String new_password = request.getParameter("new_password");
		String confirm_password_forgot = request.getParameter("confirm_password");
		
		HttpSession session = request.getSession();
		
		String email_forgot = (String) session.getAttribute("Email_id");
		
//		System.out.println(new_password);
//		System.out.println(confirm_password_forgot);
//		System.out.println(email_forgot);
		
		try 
		{
			boolean forgot_otp_result = JDBC.set_password(confirm_password_forgot, email_forgot);
			
			if(forgot_otp_result)
			{ 
				RequestDispatcher rd=request.getRequestDispatcher("set_password_msg.jsp");
				rd.forward(request, response);
				
				
			}
			else
			{
				
				request.setAttribute("password_forgot_not_set", "Password not Changed!");
				RequestDispatcher rd=request.getRequestDispatcher("Set_new_password.jsp");
				rd.forward(request, response);
				
				
			}
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
	}

}
