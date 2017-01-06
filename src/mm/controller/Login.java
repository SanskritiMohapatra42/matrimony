package mm.controller;

import java.io.IOException;
//import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.dao.UsersDao;
import mm.db.Users;

/**
 * Servlet implementation class Login
 */
@WebServlet("/mm.controller.Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		
		Users user = new Users();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//System.out.println(email+"\t"+ password);
		user.setEmail(email);		
		user.setPassword(password);
		boolean status =  UsersDao.vaidate(user);
		if(status == true)
		{
			// session store
			HttpSession session = request.getSession();
			session.setAttribute("emailid",email);
			response.sendRedirect("userhome.jsp");
		}
			
		else
		{
			
			response.sendRedirect("login.jsp?msg=Invalid Email or Password ..... :(");
		}
		
	}

}
