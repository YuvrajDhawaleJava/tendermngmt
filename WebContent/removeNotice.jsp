
<%@page
	import="java.sql.*, java.lang.Integer,com.hit.beans.NoticeBean,com.hit.utility.DBUtil,java.util.List,java.util.ArrayList,com.hit.dao.NoticeDaoImpl,com.hit.dao.NoticeDao, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<style>
th, tr {
	height: 50px;
	border: 0.5px black solid;
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

tr:hover {
	background-color: #e6e6e6;
	color: black;
}

button:hover {
	background-color: #f0f0f5;
	color: black;
	border: none
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
					style="min-width: 757px; color: green; background-color: white">Delete
					Notices</td>
			</tr>
		</table>
		<table style="background-color: white">
			<tr
				style="color: white; font-size: 22px; font-weight: bold; background-color: #660033">
				<td>Notice Id</td>
				<td>Title</td>
				<td>Description</td>
				<td>Remove ?</td>
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
				<td><a href="RemoveNoticeSrv?noticeid=<%=noticeId%>"><button>Remove</button></a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
<!-- End of container-fluid-->
<jsp:include page="footer.jsp"></jsp:include>