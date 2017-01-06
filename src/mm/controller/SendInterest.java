package mm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.dao.MatrimonyInterestDao;
import mm.db.MatrimonyInterest;

@WebServlet("/mm.controller.SendInterest")
public class SendInterest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String receiver = request.getParameter("emailid");
		String sender = (String)request.getSession().getAttribute("emailid");
		
		MatrimonyInterest mi = new MatrimonyInterest();
		mi.setReceiver(receiver);
		mi.setSender(sender);
		
		int status = MatrimonyInterestDao.save(mi);
		response.sendRedirect("personalprofile.jsp?emailid="+receiver);
	}
}
