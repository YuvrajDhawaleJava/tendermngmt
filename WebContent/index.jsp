<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<jsp:include page="loginHeader.jsp"></jsp:include>
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
	<jsp:include page="galary.jsp"></jsp:include>
</div>
<jsp:include page="footer.jsp"></jsp:include>