<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   		if(session.getAttribute("emailid") == null)
   			response.sendRedirect("login.jsp");
   %>
   
   
   <jsp:include page="usertop.jsp"></jsp:include>
   <jsp:include page="banneruser.jsp"></jsp:include>
   <jsp:include page="interestscontents.jsp"></jsp:include>
	<jsp:include page="footeruser.jsp"></jsp:include>
</body>
</html>