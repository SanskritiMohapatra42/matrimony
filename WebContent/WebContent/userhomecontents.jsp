<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mm.db.Provider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
	<div class="about-section">
		<div class="container">
		    <h3>Browse Matches</h3>
			<div class="welcome-grids">
			<ul class="ch-grid">
			
			 <%
    	
    try
    {
    	Connection con= Provider.getConnection();
    	
    	String gen, religion, cast,mothertongue;
    	
    	gen = request.getParameter("gender");
    	religion = request.getParameter("religion");
    	cast = request.getParameter("cast");
    	mothertongue = request.getParameter("mothertongue");
    	
    	if(gen==null) gen="%";
    	if(religion==null||religion.equals("")) religion="%";
    	if(cast==null||cast.equals("")) cast="%";
    	if(mothertongue==null||mothertongue.equals("")) mothertongue="%";
    	
    	
    	System.out.println(gen+" "+religion+" "+cast+" "+mothertongue);
    	
    	String sql= "select name, emailid, photo, gender from users where gender like ? AND religion like ? AND cast like ? AND mother_tongue like ?";
    	PreparedStatement pst = con.prepareStatement(sql);
    	pst.setString(1,gen);
    	pst.setString(2,religion);
    	pst.setString(3,cast);
    	pst.setString(4,mothertongue);
    	ResultSet rs = pst.executeQuery();
    	
    	while(rs.next())
    	{
    		String name = rs.getString(1);
    		String emailid = rs.getString(2);
    		String gender = rs.getString(4);
    		String g="Other";
    		if(gender.equalsIgnoreCase("Male"))
    		{
    			g="Groom";
    		}
    		else
    		{
    			g="Bride";
    		}
    		
    		InputStream fis=rs.getBinaryStream(3);
			//getting path
			
			//skip current session user's photo
			if(emailid.equals((String)session.getAttribute("emailid")))
				continue;
			
			//writing image to file
			String filePath = getServletContext().getRealPath("/profileimg/"+emailid+".jpg");
			//System.out.println("******************"+filePath);
			File file = new File(filePath);
			FileOutputStream fos=new FileOutputStream(file);
			int c=0;
			while((c=fis.read())> -1)
			{
				fos.write(c);
				
			}	
			
	   %>
	  
	   <li>
	    <a href="personalprofile.jsp?emailid=<%=emailid%>">
						<div class="col-md-6 ch-item ch-img-1" style="background-image:url('profileimg/<%=emailid %>.jpg');background-repeat:no-repeat">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1" style="background-image:url('profileimg/<%=emailid %>.jpg');background-repeat:no-repeat;background-size:cover"></div>
									<div class="ch-info-back">
										<h4><%=name %></h4>
										<h5><%=g %></h5>
									</div>	
								</div>
							</div>
						</div>
						</a>
					</li>
		
					
	   <%
	   //out.println("<img src='profileimg/"+emailid+".jpg' height='300px' />");
			//System.out.println ("Write data into file completed ");
			fos.close();
			fis.close();	
			
    	}
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    %>
					
				</ul>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
		<div class="people-section">
			<div class="container">
				<div class="people-grides">
					<h3>Match Preferences</h3>
					
					<div class="col-md-6 sign-up text-center">
					<form action="userhome.jsp" method="get" >
					<div class="cus_info_wrap gender">
						<label class="labelTop">
						Gender:
						</label>
						<input type="radio" value="male" name="gender" > Male <input type="radio" value="female" name="gender"> Female
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Religion:
						</label>
						<select name="religion" >
							<option></option>
							<option>Hindu</option>
							<option>Sikh</option>
							<option>Muslim</option>
							<option>Christian</option>
							<option>Jain</option>
							<option>Buddhist</option>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Mother tongue:
						</label>
						<select name="mothertongue">
							<option></option>
							<option>Odia</option>
							<option>Hindi</option>
							<option>English</option>
							<option>Tamil</option>
							<option>Telugu</option>
							<option>Bengali</option>
							<option>Marathi</option>
							<option>Urdu</option>
							<option>Gujurati</option>
							<option>Punjabi</option>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Cast / Division:
						</label>
						<select name="cast" >
							<option></option>
							<option>Brahmin</option>
							<option>Gopal</option>
							<option>Khandayat</option>
							<option>Kshatryia</option>
							<option>Vaishya</option>
							<option>Shudra</option>
							<option>Dalit</option>
						</select>
					</div>
					
					<div class="botton1 two">
					<input type="submit" value="Find Matches" class="btn btn-warning">
				</div>
				</form>
				</div>
					
				</div>
				
				</div>
			</div>
	<!--/peoples-->