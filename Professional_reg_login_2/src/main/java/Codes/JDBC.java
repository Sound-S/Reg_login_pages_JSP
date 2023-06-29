package Codes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class JDBC 
{
	public static Connection con;
	
	//DB connection
	public static void get_connection() throws ClassNotFoundException, SQLException
	{
	  Class.forName("com.mysql.cj.jdbc.Driver");	
	  String url="jdbc:mysql://localhost:3306/second_project";
	  String username="root";
	  String Password="12345";
	  con=DriverManager.getConnection(url,username,Password);
	}
	
	// check email_id in DB for registration 
	public static boolean check_email_id(String Email_id) throws ClassNotFoundException, SQLException
	{
		get_connection();
		
		String Login_Employee_Query ="select * from registration where email=?";
   	 
   	    PreparedStatement ps=con.prepareStatement(Login_Employee_Query);
   	    ps.setString(1, Email_id );
   	 
		ResultSet rs =ps.executeQuery();
		 
		if(rs.next())
		{
		  return true; 
		}
		return false;
	}
	
	//insert user data's into DB
	
	public static boolean insert_user_data(String fullname, String email_id, long mobile_number, String dob,
			                               String gender, String address_line_1, String address_line_2, 
			                               String country, String city, String state, long pin_code) throws ClassNotFoundException, SQLException
	{
		get_connection();
		
		String Login_Employee_Query ="insert into registration(fullname, email, mobile_number, dob, gender, address_line_1, address_line_2, country, city, state, pincode) values(?,?,?,?,?,?,?,?,?,?,?)";
	   	 
   	    PreparedStatement ps=con.prepareStatement(Login_Employee_Query);
   	    
   	    ps.setString(1, fullname);
   	    ps.setString(2, email_id);
   	    ps.setLong(3, mobile_number);
   	    ps.setString(4, dob);
   	    ps.setString(5, gender);
   	    ps.setString(6, address_line_1);
   	    ps.setString(7, address_line_2);
   	    ps.setString(8, country);
   	    ps.setString(9, city);
   	    ps.setString(10, state);
   	    ps.setLong(11, pin_code);
   	    
   	    try 
		{
		ps.executeUpdate();
		return true;
		}
		catch(Exception E)
		{
		E.printStackTrace();
		return false;
		}	
	}
	
	//OTP generation and Email sending
	
	public static String OTP_gen_mail_sending(String Email_id, String subject_define, String text_1) 
	{
		//random otp generation
		String numbers = "0123456789";
		int length = 6;
		
		String combination = numbers;
		
		char[] OTP = new char[length];
		
		Random r = new Random();
		
		for(int i = 0; i < length; i++)
		{
			OTP [i] = combination.charAt(r.nextInt(combination.length()));
		}
		
		String otp = new String(OTP);
		
		System.out.println("Generated Password is " + new String(OTP));
		
		
		//gathering all data's for mail sending
		String to = Email_id;
		String from = "torrentck3103@gmail.com";
		String subject = subject_define;
		
		String text1 = text_1;
		String text2 = otp;
		//boolean b = mail_sending.sendEmail(to, from, subject, text1,text2);
		boolean b = JDBC.sendEmail(to, from, subject, text1, text2);
		
		if(b)
		{
			System.out.println("Send Sucess");
		}
		else
		{
			System.out.println("Not Send Sucess");
		}
		return otp;
		
	}
	
	//Email sending_final method
	
	public static boolean sendEmail(String to, String from, String subject, String text1, String text2) 
	{
        boolean flag = false;

        //logic
        //smtp properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        final String username = "torrentck3103@gmail.com";
        final String password = "bftuslqwveddbwdm";


        //session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try 
        {

            Message message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(text1 + text2);
            
            Transport.send(message);
            flag = true;
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return flag;  
    }
	
	//setting password
	
	public static boolean set_password(String confirm_password, String Email_id) throws ClassNotFoundException, SQLException
	{
		
		get_connection();
		
		String set_password ="update registration set user_password=? where email=?";
	   	 
   	    PreparedStatement ps=con.prepareStatement(set_password);
   	    
   	    ps.setString(1, confirm_password);
   	    ps.setString(2, Email_id);
   	    
   	    try 
	    {
		ps.executeUpdate();
		return true;
		}
		catch(Exception E)
		{
		 E.printStackTrace();
		 return false;
		}
		
	}
	
	
	//check credentials - email_id for login
	
	public static boolean chk_credential_email_id(String email) throws ClassNotFoundException, SQLException
	{
		get_connection();
		
		String Login_query_email ="select * from registration where email=?";
	   	 
   	    PreparedStatement ps=con.prepareStatement(Login_query_email);
   	    ps.setString(1, email );
   	 
		ResultSet rs =ps.executeQuery();
		 
		if(rs.next())
		{
		  return true; 
		}
		return false;

	}
	
	//check credentials - password for login
	
		public static boolean chk_credential_password(String password) throws ClassNotFoundException, SQLException
		{
			get_connection();
			
			String Login_query_password ="select * from registration where user_password=?";
		   	 
	   	    PreparedStatement ps=con.prepareStatement(Login_query_password);
	   	    ps.setString(1, password );
	   	 
			ResultSet rs =ps.executeQuery();
			 
			if(rs.next())
			{
			  return true; 
			}
			return false;

		}
	
	
	
	
		

	
}
