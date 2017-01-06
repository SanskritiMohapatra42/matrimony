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
		    <h3>Matches</h3>
			<div class="welcome-grids">
			<ul class="ch-grid">
    <%
    	Connection con = Provider.getConnection();
    	String name1 = request.getParameter("name");
    	String name2 = name1+"%";
    	PreparedStatement ps  = con.prepareStatement("select * from users where name like ?");
    	ps.setString(1,name2);
    	ResultSet rs = ps.executeQuery();
    	if(rs.isBeforeFirst()) {
    	while(rs.next()&&!rs.getString("emailid").equals((String)session.getAttribute("emailid"))) {
    		String name = rs.getString("name");
    		String emailid = rs.getString("emailid");
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
    	}
    	}
    	else {
    %>
    	<h1>Sorry, No match found!</h1>
    <%
    	}
    	con.close();
    %>
    		</ul>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
    