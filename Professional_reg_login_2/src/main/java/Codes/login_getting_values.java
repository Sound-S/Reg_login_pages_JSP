package Codes;

//import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login_values")
public class login_getting_values extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String email = request.getParameter("email_id");
		String password = request.getParameter("password");
		
		boolean email_result;
		boolean password_result;
		try 
		{
			email_result = JDBC.chk_credential_email_id(email);
			
			HttpSession session = request.getSession();
			session.setAttribute("Generated_OTP", "email_msg");
			session.setAttribute("Email_id", "password_msg");
			
			if(email_result)
			{
				password_result = JDBC.chk_credential_password(password);
				
				if(password_result)
				{
					
					//redirect code
			
					
//					RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
//					rd.forward(request, response);
					
					
					session.setAttribute("email_id", email);
					response.sendRedirect("home.jsp");
					
					
				}
				else
				{
					System.out.println("Password not match!");
					
					 request.setAttribute("password_Err_msg", "Incorrect Password!");
					 request.getRequestDispatcher("index_login.jsp").forward(request, response);
					
				}
				
			}
			else
			{
				System.out.println("please enter valid email");
				
				request.setAttribute("email_Err_msg", "Email-Id is not registered!");
				request.getRequestDispatcher("index_login.jsp").forward(request, response);
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
