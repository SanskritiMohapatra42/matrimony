<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- signup-section-->

	<div class="signup-section">
		<div class="container">
		 <h3>Signup Page</h3>
	      <div class="login-signup-form">
				<div class="col-sm-3"> 
				</div>
			
				<div class="col-md-6 sign-up text-center">
					<form action="mm.controller.SignedUp" method="post" ">
					
					<div class="cus_info_wrap">
						<label class="labelTop">
						Name:
						<span class="require">*</span>
						</label>
						<input type="text" name="name" value="" required>
					</div>
					<div class="cus_info_wrap gender">
						<label class="labelTop">
						Gender:
						<span class="require">*</span>
						</label>
						<input type="radio" value="male" name="gender" required> Male <input type="radio" value="female" name="gender" required> Female
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Date Of Birth:
						<span class="require">*</span>
						</label>
						<select name="dd" style="width:100px" required>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
							<option>13</option>
							<option>14</option>
							<option>15</option>
							<option>16</option>
							<option>17</option>
							<option>18</option>
							<option>19</option>
							<option>20</option>
							<option>21</option>
							<option>22</option>
							<option>23</option>
							<option>24</option>
							<option>25</option>
							<option>26</option>
							<option>27</option>
							<option>28</option>
							<option>29</option>
							<option>30</option>
							<option>31</option>
						</select>
						<select name="mm" style="width:100px" required>
							<option>JANUARY</option>
							<option>FEBRUARY</option>
							<option>MARCH</option>
							<option>MAY</option>
							<option>JUNE</option>
							<option>JULY</option>
							<option>AUGUST</option>
							<option>SEPTEMBER</option>
							<option>OCTOBER</option>
							<option>NOVEMBER</option>
							<option>DECEMBER</option>
						</select>
						<select name="yyyy" style="width:100px" required>
							<%for(int i = 1980;i<=2017;i++) {%>
							<option><%=i %></option>
							<%} %>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Religion:
						<span class="require">*</span>
						</label>
						<select name="religion" required>
							<option>Hindu</option>
							<option>Sikh</option>
							<option>Muslim</option>
							<option>Christian</option>
							<option>Jain</option>
							<option>Buddhist</option>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Mother tongue:
						<span class="require">*</span>
						</label>
						<select name="mothertongue" required>
							<option>Odia</option>
							<option>Hindi</option>
							<option>English</option>
							<option>Tamil</option>
							<option>Telugu</option>
							<option>Bengali</option>
							<option>Marathi</option>
							<option>Urdu</option>
							<option>Gujurati</option>
							<option>Punjabi</option>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Cast / Division:
						<span class="require">*</span>
						</label>
						<select name="cast" required>
							<option>Brahmin</option>
							<option>Gopal</option>
							<option>Khandayat</option>
							<option>Kshatryia</option>
							<option>Vaishya</option>
							<option>Shudra</option>
							<option>Dalit</option>
						</select>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Mobile Number:
						<span class="require">*</span>
						</label>
						<input type="number" value="" name="mobile" required>
					</div>
					<div class="cus_info_wrap">
						<label class="labelTop">
						Email Id:
						<span class="require">*</span>
						</label>
						<input type="text" value="" name="email" required>
					</div>
					<div class="clearfix"></div>
				    <div class="cus_info_wrap">
						<label class="labelTop">
						Password:
						<span class="require">*</span>
						</label>
						<input type="password" value="" name="password" required>
					</div>
					<div class="clearfix"></div><div class="cus_info_wrap">
						<label class="labelTop confirmpass">
						Conform Password:
						<span class="require">*</span>
						</label>
						<input type="password" value="" name="confirmpassword" required>
					</div>
					
					
					<div class="botton1 two">
					<input type="submit" value="REGISTER HERE" class="btn btn-warning">
					<%
						String msg = request.getParameter("msg");
						if(msg!=null)
						{
					%>
					<p class="text-danger">	<%=msg %></p>
					<%
						}
					%>
					<br/>
					&nbsp;
					<br/>
				</div>
				</form>
				</div>
				<div class="col-sm-3"> 
				</div>
			
				<div class="clearfix"></div>
			</div>
		</div>
</div>
