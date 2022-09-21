
<%@page
	import="java.sql.*,com.hit.beans.VendorBean,com.hit.beans.BidderBean,java.lang.Integer,java.lang.String, com.hit.beans.TenderBean,com.hit.utility.DBUtil,java.util.List,com.hit.dao.BidderDaoImpl,com.hit.dao.BidderDao, javax.servlet.annotation.WebServlet"
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
	font-size: 15px;
	padding: 20px;
	cellpadding: 10;
	cellspacing: 10;
	margin-left: 0px;
}
</style>
</head>
<body>

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
			<!-- End of col-md-3-->
		</div>
		<!-- End of notice class-->


		<!-- Next part of same container-fluid in which galary or other information will be shown-->


		<div class="col-md-8">
			<!-- <div class="marquee" style="border:2px black hidden; background-color:white">
        <h4 style="background-color:black; margin-top:-1.8px; margin-bottom:1px;padding: 5px; text-align: center;color:red;font-weight:bold">
        &nbsp; <span id="pagetitle">Admin Account</span></h4>pagetitle id is given here
        <div class="marquee-content" style="align:center; padding-top:200px;min-height:750px;background-color:cyan">
     		 -->
			<table style="background-color: white">
				<tr
					style="color: #660033; font-size: 22px; font-weight: bold; background-color: #5c5c8a">
					<td>Application Id</td>
					<td>Tender Id</td>
					<td>Bid Amount</td>
					<td>Deadline</td>
					<td>Status</td>
				</tr>
				<%
				BidderDao dao = new BidderDaoImpl();
				VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
				List<BidderBean> bidderList = dao.getAllBidsOfaVendor(vendor.getId());

				for (BidderBean bidder : bidderList) {
				%>


				<tr>
					<td><%=bidder.getBidId()%></td>
					<td><%=bidder.getTenderId()%></td>
					<td><%=bidder.getBidAmount()%></td>
					<td><textarea cols="50" style="text-align: center" readonly><%=bidder.getBidDeadline()%></textarea></td>
					<td><%=bidder.getBidStatus()%></td>
				</tr>



				<%
				}
				%>
			</table>
			</form>
			<!-- </div>
     </div> -->
		</div>

	</div>
	<!-- End of container-fluid-->


	<!-- <div class="container" style="height:300px">
	ucomment this if you want to add some space in the lower part of page
	</div> -->



	<!-- Now from here the footer section starts-->

	<!-- Including the footer of the page -->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
