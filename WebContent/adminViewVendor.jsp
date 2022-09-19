
<%@page
	import="java.sql.*, java.lang.Integer,com.hit.beans.VendorBean,com.hit.utility.DBUtil,java.util.List,java.util.ArrayList,com.hit.dao.VendorDaoImpl,com.hit.dao.VendorDao, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<style>
th, tr {
	height: 50px;
}

td {
	min-width: 145px;
}

table {
	text-align: center;
	border-radius: 10px;
	text-align: center;
	background-color: cyan;
	margin: 20px;
	color: #5c5c8a;
	font-style: normal;
	font-size: 14px;
	padding: 20px;
	cellpadding: 10;
	cellspacing: 10;
}

tr:hover {
	background-color: #DEBEE1;
	color: black;
}

textarea:hover {
	background-color: #ADBFAF;
	color: black;
}

.button:hover {
	background-color: green;
	color: white;
	font-size: bold;
}

#show {
	text-align: center;
	border-radius: 10px;
	font-weight: bold;
	text-align: center;
	background-color: #cc9900;
	margin: 20px;
	color: black;
	font-style: normal;
	font-size: 15.5px;
	padding: 12px;
}

button:hover {
	background-color: green;
	color: white;
}
</style>
<%
String user = (String) session.getAttribute("user");
String uname = (String) session.getAttribute("username");
String pword = (String) session.getAttribute("password");

if (user == null || !user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

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
		<div id="show">Vendors Currently Registered With Us</div>
		<table style="background-color: #8fc4b7;">
			<tr
				style="color: white; font-size: 22px; font-weight: bold; background-color: #660033">
				<td>Vendor Id</td>
				<td>Vendor Name</td>
				<td>Mobile</td>
				<td>Email</td>
				<td>Company</td>
				<td>Address</td>
			</tr>
			<%
			VendorDao dao = new VendorDaoImpl();
			List<VendorBean> vendorList = dao.getAllVendors();
			for (VendorBean vendor : vendorList) {
			%>
			<tr>
				<td><a href="adminViewVendorDetail.jsp?vid=<%=vendor.getId()%>"><%=vendor.getId()%></a>
				</td>
				<td><%=vendor.getName()%></td>
				<td><%=vendor.getMobile()%></td>
				<td><%=vendor.getEmail()%></td>
				<td><%=vendor.getCompany()%></td>
				<td><textarea readonly><%=vendor.getAddress()%> </textarea></td>
			</tr>

			<%
			}
			%>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>