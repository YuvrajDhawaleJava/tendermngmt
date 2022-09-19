
<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<jsp:include page="loginHeader.jsp"></jsp:include>
<style>
.tab {
	border-radius: 1px;
	margin-left: 25%;
	width: 450px;
	font-weight: bold;
	font-style: normal;
	text-align: center;
	margin-bottom: 10px;
	padding: 20px;
}
</style>
<div class="container-fluid">
	<div class="notice">
		<div class="col-md-3" style="margin-left: 2%">
			<%
			Connection con = DBUtil.provideConnection();
			%>
			<jsp:include page="notice.jsp"></jsp:include><br>
			<jsp:include page="approved.jsp"></jsp:include><br>

		</div>
	</div>
	<div class="col-md-8">
		<div class="marquee"
			style="background-color: white; padding-top: 0px;">
			<h4
				style="background-color: black; margin-top: -1.8px; margin-bottom: 1px; padding: 5px; text-align: center; color: #ccddff; font-weight: bold">
				&nbsp; <span id="pagetitle">Account Login</span>
			</h4>
			<div class="marquee-content"
				style="align: center; padding-top: 100px; min-height: 750px; background-color: #8fc4b7">

				<table class="tab"
					style="color: blue; margin-bottom: 50px; background-color: white; padding: 25px;">
					<tr>
						<td id="show"></td>
					</tr>
				</table>
				<table class="tab hd brown">
					<tr>
						<td style="color: brown">USER LOGIN</td>
					</tr>
				</table>

				<table class="tab hd blue" cellpadding="10"
					cellspacing="10">
					<tr>
						<td>
							<form action="LoginSrv" method="post">
								<br> Username: &nbsp; <input type="text"
									placeholder="Enter Email or VendorId" name="username"
									required="required" style="color: black; font-size: 15px;"><br />
								<br /> Password: &nbsp; <input type="password" name="password"
									required="required" style="color: black; font-size: 15px;"><br />
								<br /> <input type="submit" value="Login As Vendor" name="user">&nbsp;
								&nbsp; &nbsp; &nbsp; <input type="submit" value="Login As Admin"
									name="user"><br /> <br />
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>