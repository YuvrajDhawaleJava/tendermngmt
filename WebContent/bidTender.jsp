<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.sql.*,com.hit.dao.BidderDao,com.hit.dao.BidderDaoImpl,java.lang.Integer,java.lang.String,com.hit.beans.VendorBean, com.hit.beans.TenderBean,com.hit.utility.DBUtil,java.util.List,com.hit.dao.TenderDaoImpl,com.hit.dao.TenderDao, javax.servlet.annotation.WebServlet"
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
	margin: 20px;
	color: #5c5c8a;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	cellpadding: 10;
	cellspacing: 10;
	margin: 20px;
	color: #5c5c8a;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	color: #5c5c8a;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	font-size: 15.5px;
	padding: 20px;
	padding: 20px;
}

button:hover {
	background-color: #f0f0f5;
	color: black;
	border: none
}

button {
	border: none
}
</style>
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
	<table style="background-color: white">
		<tr
			style="color: #ccccff; font-size: 22px; font-weight: bold; background-color: #660033">
			<td>Tender Id</td>
			<td>Tender Name</td>
			<td>Tender Type</td>
			<td>Tender Price</td>
			<td>Location</td>
			<td>Deadline</td>
			<td>Description</td>
			<td>Status</td>
			<td>Bid It</td>
		</tr>
		<%
		TenderDao tdao = new TenderDaoImpl();
		BidderDao bdao = new BidderDaoImpl();
		List<TenderBean> tenderList = tdao.getAllTenders();
		VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
		String vid = vendor.getId();
		for (TenderBean tender : tenderList) {
			String tid = tender.getId();
			String tname = tender.getName();
			String ttype = tender.getType();
			int tprice = tender.getPrice();
			String tloc = tender.getLocation();
			java.util.Date udeadline = tender.getDeadline();
			java.sql.Date tdeadline = new java.sql.Date(udeadline.getTime());
			String tdesc = tender.getDesc();

			String assignStatus = tdao.getTenderStatus(tid);
			boolean isAssigned = false;
			if (assignStatus.equalsIgnoreCase("assigned"))
				isAssigned = true;
			//TODO next
		%>


		<tr>
			<td><%=tid%></td>
			<td><%=tname%></td>
			<td><%=ttype%></td>
			<td><%=tprice%></td>
			<td><%=tloc%></td>
			<td><%=tdeadline%></td>
			<td><textarea readonly cols="35" rows="2"><%=tdesc%></textarea></td>
			<td><%=assignStatus%></td>
			<%
			if (!isAssigned) {
			%>
			<td><a href="bidTenderForm.jsp?tid=<%=tid%>&&vid=<%=vid%>"><button>BID
						IT</button></a></td>
		</tr>
		<%
		} else {
		%>
		<td><button>Expired</button></td>
		</tr>

		<%
		}
		}
		%>
	</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
