<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   
   
   	<jsp:include page="top.jsp"></jsp:include>
   	<jsp:include page="banner2.jsp"></jsp:include>
   	<%
						String msg = request.getParameter("msg");
						if(msg!=null)
						{
					%>
					<br/><br/><br/><br/>
					<center><h1><p class="text-success">	<%=msg %></p></h1></center>
					<%
					}%>
					<br/>
					<br/><br/><br/><br/><br/><br/>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
		