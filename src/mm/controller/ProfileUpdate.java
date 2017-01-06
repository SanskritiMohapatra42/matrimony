package mm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.dao.UsersDao;
import mm.db.Users;

/**
 * Servlet implementation class ProfileUpdate
 */
@WebServlet("/mm.controller.ProfileUpdate")
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("emailid");
		
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String dd=request.getParameter("dd");
		String mm=request.getParameter("mm");
		String yyyy=request.getParameter("yyyy");
		
		String dateofbirth=dd+mm+yyyy;
		String religion=request.getParameter("religion");
		String mothertongue=request.getParameter("mothertongue");
		String cast=request.getParameter("cast");
		String mobile=request.getParameter("mobile");
		
		Users user = new Users();
		user.setName(name);
		user.setGender(gender);
		user.setDateofbirth(dateofbirth);
		user.setReligion(religion);
		user.setMothertongue(mothertongue);
		user.setCast(cast);
		user.setMobile(mobile);
		user.setEmail(email);		
		
		int status = UsersDao.updateDetails(user);
		if(status > 0)
		{
			response.sendRedirect("profile.jsp");
			System.out.println("Yes Updated ...");
		}
		else
		{
			response.sendRedirect("profile.jsp");
			System.out.println("Not updated ...");
		}
	}

}
