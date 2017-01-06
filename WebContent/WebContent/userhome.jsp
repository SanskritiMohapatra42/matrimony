<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   <%
   		if(session.getAttribute("emailid") == null)
   			response.sendRedirect("login.jsp");
   %>
   
   
   <jsp:include page="usertop.jsp"></jsp:include>
   <jsp:include page="banneruser.jsp"></jsp:include>
   <jsp:include page="userhomecontents.jsp"></jsp:include>
	<jsp:include page="footeruser.jsp"></jsp:include>
		