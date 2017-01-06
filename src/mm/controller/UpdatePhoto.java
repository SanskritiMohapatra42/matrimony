package mm.controller;

import java.util.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import mm.dao.UsersDao;
import mm.db.Users;




/**
 * Servlet implementation class UpdatePhoto
 */
@WebServlet("/mm.controller.UpdatePhoto")
public class UpdatePhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 //private boolean isMultipart;
	   private String filePath ;
	   private int maxFileSize = 1024 * 1024;
	   private int maxMemSize = 2 * 1024 * 1024;
	   private File file ;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePhoto() {
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
		//MultipartRequest m = new MultipartRequest(request, "D:/Prabin/MM/WebContent/profileimg/raja.jpg");  
		
		//getting path
		filePath = getServletContext().getRealPath("/profileimg/");
		//getting session object
		 HttpSession session = request.getSession();
		
		//check for existing file and delete if file already exists
		file = new File(filePath+((String)session.getAttribute("emailid")+".jpg"));
		if(file.exists())
		{
			file.delete();
		}
		
		 	
		 // Check that we have a file upload request
	      //isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	      
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      factory.setRepository(new File("c:\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );

	      try{ 
	      // Parse the request to get file items.
	      List fileItems = upload.parseRequest(request);
		
	      // Process the uploaded file items
	      Iterator i = fileItems.iterator();
	      
	      while ( i.hasNext () ) 
	      {
	         FileItem fi = (FileItem)i.next();
	         if ( !fi.isFormField () )	
	         {
	            // Get the uploaded file parameters
	            String fieldName = fi.getFieldName();
	            String fileName = fi.getName();
	            String contentType = fi.getContentType();
	            String extension = fileName.substring(fileName.lastIndexOf('.'));
	          
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            
	            //naming the file to 'emailid.jpg/png'
	            file = new File( filePath+"\\" +(String)session.getAttribute("emailid")+".jpg");
	            fi.write( file ) ;
	            
	            String file_name=filePath +"\\"+(String)session.getAttribute("emailid")+".jpg";
	            //update photo field in database
	            Users u = new Users();
				u.setPhoto((String)session.getAttribute("emailid")+".jpg");
				u.setEmail((String)session.getAttribute("emailid"));
				System.out.println("-----------------"+file_name);
				int status = UsersDao.updatePhoto(u,file_name);
	            
				if(status > 0)
				{
					System.out.println("Uploaded Filename: " + fileName );
				}
	         }
	      }
	    
	   }catch(Exception ex) {
	       System.out.println(ex);
	   }
		
		
		response.sendRedirect("profile.jsp");
		
	}

}
