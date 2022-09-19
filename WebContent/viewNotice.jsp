
<%@page
	import="java.sql.*, java.lang.Integer,com.hit.beans.NoticeBean,com.hit.utility.DBUtil,java.util.List,java.util.ArrayList,com.hit.dao.NoticeDaoImpl,com.hit.dao.NoticeDao, javax.servlet.annotation.WebServlet"
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
	border: 1px red solid;
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
	background-color: #DEBEE1;
	color: black;
}

textarea:hover {
	background-color: #DEBEE1;
	color: black;
}

button:hover {
	background-color: red;
	color: white;
	font-size: bold;
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
		<!-- End of col-md-3-->
	</div>
	<!-- End of notice class-->
	<div class="col-md-8">
		<table style="background-color: white">
			<tr
				style="color: white; font-size: 22px; font-weight: bold; background-color: #660033">
				<td>Notice Id</td>
				<td>Title</td>
				<td>Description</td>
			</tr>
			<%
			NoticeDao dao = new NoticeDaoImpl();
			List<NoticeBean> noticeList = dao.viewAllNotice();

			for (NoticeBean notice : noticeList) {

				int noticeId = notice.getNoticeId();

				String noticeTitle = notice.getNoticeTitle();

				String noticeDesc = notice.getNoticeInfo();
			%>
			<tr>
				<td><%=noticeId%></td>
				<td><%=noticeTitle%></td>
				<td cols="70"><%=noticeDesc%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
<!-- End of container-fluid-->
<jsp:include page="footer.jsp"></jsp:include>