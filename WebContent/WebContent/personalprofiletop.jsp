<%@page import="java.io.File"%>
<%@page import="mm.dao.*"%>
<%@page import="mm.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Wed Day a Wedding Planner Category Flat Bootstarp Resposive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Wed Day Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery-1.11.1.min.js"></script>
<!--webfonts-->
  <link href='http://fonts.googleapis.com/css?family=Lora:400,400italic|Niconne' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
<!--start-home-->
<!-- header -->	
	<div class="header" id="home">
		<div class="container">
			<div class="header-left">
			
			<%
					
					String path = getServletContext().getRealPath("/profileimg/"+(String)session.getAttribute("emailid")+".jpg");
			File file = new File(path);
			if (file.exists()) 
			{
			  out.println("<img src='profileimg/"+(String)session.getAttribute("emailid")+".jpg' height='300px' class='profileimg' />"); 
			}
			else
			{
				%>
				 	<img src="profileimg/profile-default.jpg" class='profileimg' /> 
				 	<%
				 
			}
			 %>
			
				<h4>Welcome: <%
					String emailid = (String)session.getAttribute("emailid"); 
				int n = MatrimonyMailDao.getRows(emailid);
				int i = MatrimonyInterestDao.getRows(emailid);
				%>
				<%=emailid %></h4>
				
			</div>
			<div class="header-right">
			 <ul class="nav">
				<li class="inlinelist"><a href="profile.jsp"> Visit/Edit Profile</a></li>
				<li class="inlinelist"><a href="changepassword.jsp"> Change Password</a></li>
				<li class="inlinelist"><a href="interests.jsp">Interested:<%=i%></a></li>
				<li class="inlinelist"><a href="messages.jsp">Messages:<%=n%></a></li>
				<li class="inlinelist"><a href="logout.jsp">Logout</a></li>
			</ul>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>	
<!-- //header -->