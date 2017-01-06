<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--/signup-section-->

  
	<div class="signup-section">
		<div class="container">
		 <h3>Change Your Password</h3>
	      <div class="login-signup-form">
	      <div class="col-sm-3">	      
	      </div>
	      
				<div class="col-md-6 login text-center">
					
					<form action="mm.controller.ChangePassword" method="get">
					
					<div class="cus_info_wrap">
						<label class="labelTop">
						Current Password:
						<span class="require">*</span>
						</label>
						<input type="password" value="" name="cntpassword">
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						New Password:
						<span class="require">*</span>
						</label>
						<input type="password" value="" name="newpassword">
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Re-tpe Password:
						<span class="require">*</span>
						</label>
						<input type="password" value="" name="repassword">
					</div>
					<div class="clearfix"></div>
					<div class="sky-form">
					<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Remember me on this computer </label>
				</div>
				<div class="botton1">
					<input type="submit" value="SIGNIN" class="botton">
					<%
						String msg = request.getParameter("msg");
						if(msg!=null)
						{
					%>
					<p class="text-danger">	<%=msg %></p>
					<%
					}%>
				
				</div>
				</form>
				<form action="mm.controller.Forgot" method="post">
				<div class="forgetit">
					<a href="">forgot your password?</a>
					<input type="text"  name="email" class="text" value="Enter email to reset it" onfocus="this.value = '';" onblur="if (this.value == 'Enter email to reset it') {this.value = 'Enter email to reset it';}">
					<input type="submit" value="FORGET" class="botton">
				</div>				
			</form>
		</div>		
		<div class="col-sm-3">
		</div>
				<div class="clearfix"></div>
			</div>
		</div>
</div>
