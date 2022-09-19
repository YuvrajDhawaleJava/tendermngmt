
<%@page
	import="java.sql.*,java.lang.Integer,java.lang.String, com.hit.beans.TenderStatusBean,com.hit.utility.DBUtil,java.util.List,com.hit.dao.TenderDaoImpl,com.hit.dao.TenderDao, javax.servlet.annotation.WebServlet"
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
	color: blue;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	cellpadding: 10;
	cellspacing: 10;
}

tr:hover {
	background-color: #e6e6e6;
	color: black;
}

button:hover {
	background-color: #f0f0f5;
	color: black;
	border:none
}
button {
	border:none
}
</style>
</head>
<body>


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
				-->
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
					<td id="show"
						style="min-width: 1000px; background-color: white; min-height: 0px; font-weight: bold">All
						Assigned Tenders List</td>
				</tr>
			</table>
			<table style="background-color: white; margin-left: 30%;">
				<tr
					style="color: white; font-size: 22px; font-weight: bold; background-color: brown">
					<td>Tender Id</td>
					<td>Vendor Id</td>
					<td>Application Id</td>
					<td>Status</td>
				</tr>
				<%
				TenderDao dao = new TenderDaoImpl();
				List<TenderStatusBean> statusList = dao.getAllAssignedTenders();

				for (TenderStatusBean status : statusList) {
				%>
				<tr>
					<td><a
						href="viewTenderBidsForm.jsp?tid=<%=status.getTendorId()%>"><%=status.getTendorId()%></a></td>
					<td><a
						href="adminViewVendorDetail.jsp?vid=<%=status.getVendorId()%>"><%=status.getVendorId()%></a></td>
					<td><%=status.getBidderId()%></td>
					<td><%=status.getStatus()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>