<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- banner -->
<div class="banner two">
		<div class="container">
			<div class="banner-navigation">
					<div class="logo">
						<a href="index.html"><h1>Wed<span> Day</span></h1></a>
						
						
					</div>
					<span class="menu"></span>
						<div class="top-menu">
								<ul class="nav">
									<li>
										<form action="searchusers.jsp" method="get">
										<ul class="searchform">
										<li><input type="text" placeholder="Search users by name..." name="name" id="searchbar"></li>
										</ul>
										</form>
									</li>
									<li class="hvr-sweep-to-bottom"><a href="userhome.jsp">Home</a></li>
									<li class="hvr-sweep-to-bottom"><a href="aboutus.jsp">About</a></li>
									<li class="hvr-sweep-to-bottom"><a href="moments.jsp">Big Moments</a></li>
									<li class="hvr-sweep-to-bottom"><a href="contact.jsp">Contact Us</a></li>
								</ul>
								<div class="clearfix"></div>
						</div>
						<!--script-for-menu-->
								<script>
									$("span.menu").click(function(){
										$(".top-menu ul").slideToggle("slow" , function(){
										});
									});
								</script>
					<!--script-for-menu-->
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!--//banner-->