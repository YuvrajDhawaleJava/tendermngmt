
<%@page
	import="java.sql.*,java.lang.Integer,java.lang.String, com.hit.beans.TenderBean,com.hit.utility.DBUtil,java.util.List,com.hit.dao.TenderDaoImpl,com.hit.dao.TenderDao, javax.servlet.annotation.WebServlet"
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

	if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {
		response.sendRedirect("loginFailed.jsp");
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid">
		<%
		Connection con = DBUtil.provideConnection();
		%>
		<div class="col-md-8">
			<table style="background-color: white">
				<tr
					style="color: white; font-size: 22px; font-weight: bold; background-color: brown">
					<td>Tender Id</td>
					<td>Tender Name</td>
					<td>Tender Type</td>
					<td>Tender Price</td>
					<td>Location</td>
					<td>Deadline</td>
					<td>Description</td>
					<td>View Bids</td>
				</tr>
				<%
				TenderDao dao = new TenderDaoImpl();
				List<TenderBean> tenderList = dao.getAllTenders();
				for (TenderBean tender : tenderList) {
					String tid = tender.getId();
					String tname = tender.getName();
					String ttype = tender.getType();
					int tprice = tender.getPrice();
					String tloc = tender.getLocation();
					java.util.Date udeadline = tender.getDeadline();
					java.sql.Date tdeadline = new java.sql.Date(udeadline.getTime());
					String tdesc = tender.getDesc();
				%>
				<tr>
					<td><a href="viewTenderBidsForm.jsp?tid=<%=tid%>"><%=tid%></a></td>
					<td><%=tname%></td>
					<td><%=ttype%></td>
					<td><%=tprice%></td>
					<td><%=tloc%></td>
					<td><%=tdeadline%></td>
					<td><textarea rows="2" cols="40" readonly><%=tdesc%></textarea></td>
					<td><a href="viewTenderBidsForm.jsp?tid=<%=tid%>"><button>View
								Bids</button></a></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>