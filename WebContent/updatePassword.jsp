
<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet, com.hit.beans.VendorBean"
	errorPage="errorpage.jsp"%>
<%
String user = (String) session.getAttribute("user");
String uname = (String) session.getAttribute("username");
String pword = (String) session.getAttribute("password");

if (user == null || !user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")) {

	response.sendRedirect("loginFailed.jsp");

}
%>
<jsp:include page="vendorHeader.jsp"></jsp:include>
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
		<table style="border-radius: 10px">
			<tr>
				<td id="show" style="min-width: 700px; min-height: 0px; color: blue">Edit
					Details And Click on Update</td>
			</tr>
		</table>
		<%
		VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
		%>
		<form action="ChangePasswordSrv" method="post">
			<table style="background-color: white">
				<th colspan="2">Change Password<input type="hidden" name="vid"
					value="<%=vendor.getId()%>"></th>
				<tr>
					<td style="color: red">Enter Old Password:</td>
					<td><input type="password" name="oldpassword"
						required="required"></td>
				</tr>
				<tr>
					<td style="color: red">Enter New Password:</td>
					<td><input type="password" name="newpassword"
						required="required"></td>
				</tr>
				<tr>
					<td style="color: red">Re-Enter New Password:</td>
					<td><input type="password" name="verifynewpassword"
						required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input style="border: none"
						type="submit" value="Change Password"></td>
				</tr>

			</table>
		</form>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<style>
input, textarea, select {
	min-width: 450px;
	font-size: 16px;
	background-color: #f8f8f8;
}

input:hover, textarea:hover, select:hover {
	min-width: 450px;
	background-color: white;
}

table, th, td {
	margin-bottom: 10px;
	margin-left: 20%;
	font-size: 20px;
	text-align: center;
	background-color: white;
	color: #003399;
}

td {
	padding: 12px;
	background-color: none;
}

th {
	padding: 12px;
	background-color: #660033;
	color: white;
	font-weight: bold;
}
</style>