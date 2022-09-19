
<%@page
	import="java.sql.*,com.hit.dao.BidderDao,com.hit.dao.BidderDaoImpl, java.lang.Integer,com.hit.beans.BidderBean,com.hit.utility.DBUtil,java.util.List,java.util.ArrayList,com.hit.dao.TenderDaoImpl,com.hit.dao.TenderDao, javax.servlet.annotation.WebServlet"
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
	background-color: #f0f0f5;
	color: black;
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
				<td id="show"
					style="min-width: 1000px; background-color: white; min-height: 0px; color: red">Tender
					Bids For TendorId: <%=request.getParameter("tid")%></td>
			</tr>
		</table>
		<table style="background-color: white">
			<tr
				style="color: white; font-size: 22px; font-weight: bold; background-color: #660033">
				<td>Bidder Id</td>
				<td>Vendor Id</td>
				<td>Bid Amount</td>
				<td>Deadline</td>
				<td>Status</td>
				<td>Accept</td>
				<td>Reject</td>
			</tr>
			<%
			BidderDao dao = new BidderDaoImpl();
			List<BidderBean> bidderList = dao.getAllBidsOfaTender(request.getParameter("tid"));
			boolean isPending = false;
			for (BidderBean bidder : bidderList) {
				isPending = false;
				String status = bidder.getBidStatus();
				if (status.equalsIgnoreCase("pending"))
					isPending = true;
			%>
			<tr>
				<td><%=bidder.getBidId()%></td>
				<td><a
					href="adminViewVendorDetail.jsp?vid=<%=bidder.getVendorId()%>"><%=bidder.getVendorId()%></a></td>
				<td><%=bidder.getBidAmount()%></td>
				<td><%=bidder.getBidDeadline()%></td>
				<td><%=bidder.getBidStatus()%></td>
				<%
				if (isPending) {
				%>
				<td><a
					href="AcceptBidSrv?bid=<%=bidder.getBidId()%>&tid=<%=bidder.getTenderId()%>&vid=<%=bidder.getVendorId()%>"><button
							id="bt1">Accept</button></a></td>
				<td><a
					href="RejectBidSrv?bid=<%=bidder.getBidId()%>&tid=<%=bidder.getTenderId()%>&vid=<%=bidder.getVendorId()%>"><button>Reject</button></a></td>
				<%
				} else {
				%>
				<td style="color: red;"><%=status%></td>
				<td style="color: red;"><%=status%></td>
				<%
				}
				%>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>