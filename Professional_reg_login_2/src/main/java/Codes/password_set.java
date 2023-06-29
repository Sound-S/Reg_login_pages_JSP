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

@WebServlet("/password_set")
public class password_set extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		HttpSession session = request.getSession();
		
		String Email_id = (String) session.getAttribute("Email_id");
		
		try 
		{
			boolean account_msg = JDBC.set_password(confirm_password, Email_id);
			
			if(account_msg)
			{
				System.out.println("password set successfully!");
				
				RequestDispatcher rd=request.getRequestDispatcher("password_set_message.jsp");
				rd.forward(request, response);
				
				
			}
			else
			{
				System.out.println("password not set!");
				
				
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
