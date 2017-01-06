package mm.controller;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.catalina.User;

import mm.dao.UsersDao;
import mm.db.*;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/mm.controller.ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cntpassword=request.getParameter("cntpassword");
		String newpassword=request.getParameter("newpassword");
		//String repassword=request.getParameter("repassword");
		
		HttpSession session = request.getSession();
		String currentpassword = UsersDao.getPassword((String)session.getAttribute("emailid"));
		System.out.println(cntpassword);
		if((cntpassword.equals(currentpassword)) == false)
		{
			//RequestDispatcher rd = request.getRequestDispatcher("changepassword.jsp");
//			/rd.include(request, response);
			response.sendRedirect("changepassword.jsp?msg=Invalid current password!!");
			
		}
		else
		{
			Users u = new Users();
			u.setPassword(newpassword);
			u.setEmail((String)session.getAttribute("emailid"));
			int status = UsersDao.updatePassword(u);
			if(status > 0)
			{
				response.sendRedirect("changepassword.jsp?msg=Password changed successfully!!");
			}
		}
	}


}
