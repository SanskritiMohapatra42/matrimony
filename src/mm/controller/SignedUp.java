package mm.controller;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.dao.UsersDao;
import mm.db.Users;

/**
 * Servlet implementation class signedup
 */
@WebServlet("/mm.controller.SignedUp")
public class SignedUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignedUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		
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
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");
		//String photo = request.getParameter("photo");
		//System.out.println(photo);
		//System.out.println(name+"\t"+gender+"\t"+dateofbirth+"\t"+religion+"\t"+cast+"\t"+mobile+"\t"+email+"\t"+password+"\t"+confirmpassword);
		
		Users user = new Users();
		user.setName(name);
		user.setGender(gender);
		user.setDateofbirth(dateofbirth);
		user.setReligion(religion);
		user.setMothertongue(mothertongue);
		user.setCast(cast);
		user.setMobile(mobile);
		user.setEmail(email);		
		user.setPassword(password);
		user.setConfirmpassword(confirmpassword);
		
		int status =  UsersDao.save(user);
		
		if(status > 0)
		{
			response.sendRedirect("success.jsp?msg=Yes Successfully registered ..........");
		}
		else
		{
			response.sendRedirect("signedup.jsp?msg=Cannot Registerd ...........");
			
		}
		
		
		
	}

}
