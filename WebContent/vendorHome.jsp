
<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<%
String user = (String) session.getAttribute("user");
String uname = (String) session.getAttribute("username");
String pword = (String) session.getAttribute("password");

if (!user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")) {

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
		<div class="marquee"
			style="border: 2px black hidden; background-color: white">
			<h4
				style="background-color: black; margin-top: -1.8px; margin-bottom: 1px; padding: 5px; text-align: center; color: #ccddff; font-weight: bold">
				&nbsp; <span id="pagetitle">VENDOR ACCOUNT</span>
			</h4>
			<div class="marquee-content"
				style="align: center; padding-top: 200px; min-height: 750px; background-color: #8fc4b7">
				<h1>
					<center>Hey Dude! Welcome to Our Tender Management system</center>
				</h1>
				<h2>
					<center>Here You can manage your tenders,view tenders and
						bid for tenders according to their deadline and base price</center>
				</h2>
				<h3>
					<center>Go on the about menu section links to explore the
						site</center>
				</h3>
				<h3>
					<center>You can also update your profile, change password
						and can explore many more things!</center>
				</h3>
			</div>
		</div>
	</div>
	<a><h1></h1></a>
</div>
<jsp:include page="footer.jsp"></jsp:include>