<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--footer-->
	<div class="footer">
		  <div class="container">
			 <div class="copy">
		              <p>&copy; 2016 All Rights Reserved. Design by <a href="http://www.cutm.ac.in/">CUTM</a> </p>
		      </div>
			  <div class="header-right b-lost">
			    <ul class="f-icons two">
					<li><a href="https://www.facebook.com/centurionuniversity/" class="facebook"> </a></li>
					<li><a href="https://twitter.com/CUTMIndia" class="twitter"> </a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		 </div>
	 </div>
			<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
								</script>
							<!--start-smoth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>