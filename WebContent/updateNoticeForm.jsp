
<%@page
	import="java.sql.*, com.hit.beans.NoticeBean,com.hit.utility.DBUtil,com.hit.dao.NoticeDao,com.hit.dao.NoticeDaoImpl,javax.servlet.annotation.WebServlet"
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
		<!-- End of col-md-3-->
	</div>
	<!-- End of notice class-->
	<div class="col-md-8">
		<table style="border-radius: 10px">
			<tr>
				<td id="show" style="min-width: 637px; min-height: 0px; color: blue">Enter
					Notice Details Below</td>
			</tr>
		</table>
		<%
		int noticeId = Integer.parseInt(request.getParameter("nid"));
		NoticeDao dao = new NoticeDaoImpl();
		NoticeBean notice = dao.getNoticeById(noticeId);
		%>
		<form action="UpdateNoticeSrv" method="post">
			<table style="background-color: white">
				<th colspan="2">Update Notice No.<%=noticeId%><input
					type="hidden" name="nid" value="<%=noticeId%>"></th>
				<tr>
					<td style="color: red">Notice Title :</td>
					<td><input type="text" name="title" required="required"
						value="<%=notice.getNoticeTitle()%>"></td>
				</tr>
				<tr>
					<td style="color: red">Descripton :</td>
					<td><textarea rows="4" cols="40" style="font-size: 15px"
							name="info" required="required"><%=notice.getNoticeInfo()%></textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center" value="Launch"><input
						type="submit"
						style="background-color: #660033; color: white; border: none;"
						value="Update This Notice"></td>
				</tr>

			</table>
		</form>
	</div>
</div>
<!-- End of container-fluid-->
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
	margin-left: 20%;
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
</html>
