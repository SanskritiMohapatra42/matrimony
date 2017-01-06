<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
    	String emailid = (String)session.getAttribute("emailid");
    	if(emailid==null) {
    %>
   <jsp:include page="top.jsp"></jsp:include>
   <% }
    	else {%>
    <jsp:include page="usertop.jsp"></jsp:include>	
    <%} %>
   <jsp:include page="banner2.jsp"></jsp:include>
   <<jsp:include page="contactcontents.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>