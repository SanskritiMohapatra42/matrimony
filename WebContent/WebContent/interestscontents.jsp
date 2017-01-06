<%@page import="java.sql.*"%>
<%@page import="mm.dao.*"%>
<%@page import="mm.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
		String emailid = (String)session.getAttribute("emailid");
		ResultSet rs = MatrimonyInterestDao.getInterests(emailid);
		int n = MatrimonyInterestDao.getRows(emailid);
		
	%>
<div class="contact">
  <div class="container">
  	<%
  		if(n==0)
		{
  	%>
  		<h3>Sorry, You have no interested users</h3>
  	<%
  		}
  		else {
  	%>
  		
        <h3>Interested Users</h3>
        <ol style="text-align:center">
            <%
            	while(rs.next()) {
            		String sender = rs.getString("sender");
            %>
                <li style="background-color:gainsboro"><h2  style="display:inline-block;margin:0px 10px;"><%=sender%></h2><a style="border:1px solid grey;padding:12px;margin:0px 20%;display:inline-block" href="personalprofile.jsp?emailid=<%=sender%>">View Profile</a></li>
            <%
            	}
  			}	
            %>
        </ol>
    </div>
    </div>