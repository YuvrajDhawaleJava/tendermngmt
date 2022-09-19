<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<%
String user = (String) session.getAttribute("user");
String uname = (String) session.getAttribute("username");
String pword = (String) session.getAttribute("password");

if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {
	response.sendRedirect("loginFailed.jsp");
}
%>
<jsp:include page="header.jsp"></jsp:include>
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
		<form action="CreateTenderSrv" method="post">
			<table style="background-color: #8fc4b7">
				<th colspan="2">Add New Tenders</th>
				<tr>
					<td>Tender Name :</td>
					<td><input type="text" name="tname" required="required"></td>
				</tr>
				<tr>
					<td>Tender Type :</td>
					<td><select name="ttype" required="required">
							<option value="construction">Construction</option>
							<option value="research">Research</option>
							<option value="maintainence">Maintainence</option>
							<option value="buisness">Buisness-implementation</option>
							<option value="software">Software</option>
							<option value="others">Others</option>
					</select></td>
				</tr>
				<tr>
					<td>Base Price :</td>
					<td><input type="number" name="tprice" required="required"></td>
				</tr>
				<tr>
					<td>Strict Deadline:</td>
					<td><input type="date" name="tdeadline" required="required"></td>
				</tr>
				<tr>
					<td>Location :</td>
					<td><input type="text" name="tloc" required="required"></td>
				</tr>
				<tr>
					<td>Description :</td>
					<td><textarea rows="4" cols="40" style="font-size: 15px"
							name="tdesc" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input class ="btn"
						style="border: none; font-weight: bold;" type="submit"
						value="Launch This Tender" name="user"></td>
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
}

.btn:hover {
	background-color: #0a0a23;
	color: #fff;
	border: none;
	border-radius: 10px;
}

textarea:hover, select:hover {
	min-width: 450px;
	background-color: white;
}

table, th, td {
	margin-bottom: 10px;
	margin-left: 10%;
	font-size: 20px;
	text-align: center;
	background-color: #8FC4A6;
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