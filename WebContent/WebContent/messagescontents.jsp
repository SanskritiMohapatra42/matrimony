<%@page import="java.sql.*"%>
<%@page import="mm.dao.*"%>
<%@page import="mm.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
		String emailid = (String)session.getAttribute("emailid");
		ResultSet rs = MatrimonyMailDao.getMessages(emailid);
		int n = MatrimonyMailDao.getRows(emailid);
		
	%>
<div class="contact">
  <div class="container">
  	<%
  		if(n==0)
		{
  	%>
  		<h3>Sorry, You have no messages</h3>
  	<%
  		}
  		else {
  	%>
  		
        <h3>Messages</h3>
        <table class="table">
            
            <tr style="padding-left:15em">
                <td><h4>NAME</h4></td> <td><h4>SUBJECT</h4></td> <td><h4>MESSAGE</h4></td> <td><h4>SENDER</h4></td> <td><h4>DATE</h4></td>
            </tr>
            
            
            <%
            	while(rs.next()) {
            		String name = rs.getString("name");
            		String sender = rs.getString("sender");
            		String date = rs.getString("msgdate");
            		String message = rs.getString("message");
            		String subject = rs.getString("subject");
            %>
             <tr style="padding-left:15em">
                <td><h5><%=name%></h5></td> <td><h5><%=subject%></h5></td> <td><h5><%=message%></h5></td> <td><h5><%=sender%></h5></td> <td><h5><%=date%></h5></td>
            </tr>
            <%
            	}
  			}	
            %>
        </table>
    </div>
    </div>