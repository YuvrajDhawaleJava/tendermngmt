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
	margin: 20px;
	color: #5c5c8a;
	font-style: normal;
	font-size: 15.5px;
	padding: 20px;
	cellpadding: 10;
	cellspacing: 10;
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
	<div class="col-md-8">
		<table style="background-color: white">
			<tr
				style="color: white; font-size: 22px; font-weight: bold; background-color: brown">
				<td>Tender Name</td>
				<td>Tender Type</td>
				<td>Base Price</td>
				<td>Location</td>
				<td>Deadline</td>
				<td>Description</td>
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
				<td><%=tname%></td>
				<td><%=ttype%></td>
				<td><%=tprice%></td>
				<td><%=tloc%></td>
				<td><%=tdeadline%></td>
				<td><textarea rows="2" cols="45"><%=tdesc%></textarea></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>