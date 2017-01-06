package mm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.dao.MatrimonyMailDao;
import mm.db.MatrimonyMail;

@WebServlet("/mm.controller.SendMessage")
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public SendMessage() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String subject = request.getParameter("sub");
		String message = request.getParameter("msg");
		String receiver = request.getParameter("emailid");
		String sender = (String)request.getSession().getAttribute("emailid");
		String msgdate = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
		
		MatrimonyMail mail = new MatrimonyMail();
		mail.setName(name);
		mail.setMessage(message);
		mail.setMsgDate(msgdate);
		mail.setReceiver(receiver);
		mail.setSender(sender);
		mail.setSubject(subject);
		
		int status = MatrimonyMailDao.save(mail);
		
		if(status > 0)
		{
			response.sendRedirect("personalprofile.jsp?emailid="+receiver+"&msgstatus=1");
		}
		else
		{
			response.sendRedirect("personalprofile.jsp?emailid="+receiver+"&msgstatus=0");
			
		}
	}
}
