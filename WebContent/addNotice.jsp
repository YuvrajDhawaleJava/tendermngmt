
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
		<table style="border-radius: 10px">
			<tr>
				<td id="show" style="min-width: 636px; min-height: 0px; color: blue">Enter
					Notice Details Below</td>
			</tr>
		</table>
		<form action="AddNoticeSrv" method="post">
			<table style="background-color: white">
				<th colspan="2">Add Notice</th>
				<tr>
					<td style="color: red">Notice Title:</td>
					<td><input type="text" name="title" required="required"></td>
				</tr>
				<tr>
					<td style="color: red">Descripton :</td>
					<td><textarea rows="4" cols="40" style="font-size: 15px"
							name="info" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center" value="Launch"><input
						type="submit"
						style="background-color: #660033; color: white; border: none;"
						value="Add Notice to Notice Board" name="user"></td>
				</tr>
			</table>
		</form>
	</div>


</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
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
	margin-left: 15%;
	font-size: 20px;
	text-align: center;
	background-color: white;
	color: #003399;
}

td {
	padding: 20px;
	background-color: none;
}

th {
	padding: 20px;
	background-color: #660033;
	color: white;
	font-weight: bold;
}
</style>