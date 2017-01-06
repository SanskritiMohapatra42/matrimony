package mm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.dao.UsersDao;

/**
 * Servlet implementation class Forgot
 */
@WebServlet("/mm.controller.Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forgot() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String to= request.getParameter("email");
		 System.out.println(to);
	    //Get the session object  
	    Properties props = new Properties();  
	    props.put("mail.smtp.host", "smtp.gmail.com");  
	    props.put("mail.smtp.socketFactory.port", "465");  
	    props.put("mail.smtp.socketFactory.class",  
	              "javax.net.ssl.SSLSocketFactory");  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.port", "465");  
	     
	    Session session = Session.getDefaultInstance(props,  
	     new javax.mail.Authenticator() 
	      {  
	     protected PasswordAuthentication getPasswordAuthentication() {  
	     return new PasswordAuthentication("barikbishnu192@gmail.com","bapabaulit");//change accordingly  
	     }  
	  });  
	   
	  //compose message  
	  try {  
	   MimeMessage message = new MimeMessage(session);  
	   message.setFrom(new InternetAddress("barikbishnu192@gmail.com"));//change accordingly  
	   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	   String password = UsersDao.getPassword(to);
	   if(password == null)
		   out.println("You have enterd an invalid emaild  ......");
	   else
	   {
		   message.setSubject("Hello");  
		   message.setText("Your password is : "+password);  
		     
		   //send message  
		   Transport.send(message);  
		  
		   System.out.println("message sent successfully");  

	   }
	  } catch (MessagingException e) {throw new RuntimeException(e);}  
	   
	}

}
