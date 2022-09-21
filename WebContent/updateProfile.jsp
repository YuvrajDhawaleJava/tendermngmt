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
				<td id="show" style="min-width: 632px; min-height: 0px; color: blue">Edit
					Details And Click on Update</td>
			</tr>
		</table>

		<%
		VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
		%>

		<form action="UpdateProfileSrv" method="post">
			<table style="background-color: white">
				<th colspan="2">Update Profile</th>
				<tr>
					<td style="color: red">Vendor Id :</td>
					<td><input type="hidden" name="vid"
						value="<%=vendor.getId()%>"><%=vendor.getId()%></td>
				</tr>
				<tr>
					<td style="color: red">Vendor Name:</td>
					<td><input type="text" name="vname" required="required"
						value="<%=vendor.getName()%>"></td>
				</tr>
				<tr>
					<td style="color: red">Mobile No. :</td>
					<td><input type="number" name="vmob" required="required"
						value="<%=vendor.getMobile()%>"></td>
				</tr>
				<tr>
					<td style="color: red">Email Id :</td>
					<td><input type="email" name="vemail" required="required"
						value="<%=vendor.getEmail()%>"></td>
				</tr>
				<tr>
					<td style="color: red">Address :</td>
					<td><textarea rows="2" cols="40" style="font-size: 15px"
							name="vaddr" required="required"><%=vendor.getAddress()%> </textarea></td>
				</tr>
				<tr>
					<td style="color: red">Company Name :</td>
					<td><input type="text" name="vcompany" required="required"
						value="<%=vendor.getCompany()%>"></td>
				</tr>
				<tr>
					<td style="color: red">Verify Password:</td>
					<td><input type="password" name="vpass" required="required"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" value="Launch"><input
						type="submit" value="Update Profile" name="user" style="border:none"></td>
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