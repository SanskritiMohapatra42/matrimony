<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="mm.dao.*"%>
<%@page import="mm.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- signup-section-->


<div class="signup-section">
	<%
		String id=request.getParameter("emailid");
		String msg = request.getParameter("msgstatus");
		if(msg==null)
			msg="0";
		int msgstatus=Integer.parseInt(msg);
	%>
		<div class="container">
		 <h3>Profile Details </h3>
	      <div class="login-signup-form">
	     
	      
				<div class="col-md-6 login text-center">
					<%
					String path = getServletContext().getRealPath("/profileimg/"+id+".jpg");
					File file = new File(path);
					boolean status = UsersDao.checkPhoto(id , path);
					System.out.println(status);
					
					if(status == true)
					{
						out.println("<img src='profileimg/"+id+".jpg' height='300px' />");
					}
					%>
					<!-- <form action="mm.controller.UpdatePhoto" method="post" enctype="multipart/form-data"> -->
					<%
					
			if (file.exists()) 
			{
			  //out.println("<img src='profileimg/"+(String)session.getAttribute("emailid")+".jpg' height='300px' />"); 
			 /*  out.println("<input type='file' name='upfile' >");
			  out.println("<input type='submit' value='UPDATE PHOTO'>");
			   */
			  System.out.println ("existing path is : "+path);
			}
			else
			{
				 System.out.println ("path is : "+path);
				%>
				 	<img src="profileimg/profile-default.jpg" height="300px"  /> <br>
				 	
				 <!-- 	<input type="file" name="upfile" id='fileup'>
				 	<input type="submit" value="UPDATE PHOTO" onclick="getFilePath">
				  -->
				 	<%
				 
			}
			 %>
			
				
		</div>		
		
						<div class="col-md-6 sign-up text-center">
					
					<%
						
						String emailid = id;
						Users user = UsersDao.getDetails(emailid);
						String name=user.getName();
						String cast = user.getCast();
						String mobile= user.getMobile();
						String mothertongue = user.getMothertongue();
						String religion = user.getReligion();
						String gender = user.getGender();
						String dob = user.getDateofbirth();
								
					%>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Name:
						</label>
						<p><%=name %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Gender:
						</label>
						<p><%=gender %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Date Of Birth:
						</label>
						<p><%=dob %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Religion:
						</label>
						<p><%=religion %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Mother tongue:
						</label>
						<p><%=mothertongue %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Cast / Division:
						</label>
						<p><%=cast %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop" value=<%=mobile %>>
						Mobile Number:
						</label>
						<p><%=mobile %></p>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop" >
						Email Id:
						</label>
						<p><%=emailid %></p>
					</div>
					
       							<form action="mm.controller.SendInterest?emailid=<%=id%>" method="post">
								   <div class="submit"> 
								    	<input type="submit" value="I'm Interested" />
					              </div>
								</form>
					
					<div class="clearfix"></div>
				   
					
					<div class="botton1 two">
					<!-- <input type="submit" value="UPDATE" class="btn btn-warning">
					 -->
					
					<br/>
					&nbsp;
					<br/>
				</div>
				
				</div>
		
				<div class="clearfix"></div>
				
				<div class="contact">
				
				
				<%if(msgstatus==0) {%>
				 	<div class="container">
					 		<h3>Send A Message</h3>
						 <div class="contact-content">
       							<form action="mm.controller.SendMessage?emailid=<%=emailid%>" method="post">
							    	<input name="name" type="text" class="textbox" value=" Your Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name';}">
							    	<input name="sub" type="text" class="textbox" value=" Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
										<div class="clear"> </div>
								    <div>
								    	<textarea name="msg" placeholder="Message:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Message ';}">Your Message</textarea>
								    </div>	
								   <div class="submit"> 
								    	<input type="submit" value="SEND " />
					              </div>
								</form>
							</div>
					</div>
					<%
					}
				else {
					%>
					<div class ="container">
						<h3>Your message has been sent successfully.</h3>
					</div>
					<%
				}
				%>
		</div>
</div>


<!-- signup-section-->



	<!--<div class="signup-section">
		<div class="container">
		 
	      <div class="login-signup-form">
				<div class="col-sm-6"> 
				</div>
			

				<div class="col-sm-3"> 
				</div>
			
				<div class="clearfix"></div>
			</div>
		</div>
	</div>-->
