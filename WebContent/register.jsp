<%@page
	import="java.sql.*, com.hit.utility.DBUtil, javax.servlet.annotation.WebServlet"
	errorPage="errorpage.jsp"%>
<jsp:include page="loginHeader.jsp"></jsp:include>

<style>
.tab {
	border-radius: 10px;
	margin-left: 25%;
	width: 450px;
	color: green;
	font-weight: bold;
	font-style: normal;
	text-align: center;
	font-size: 20px;
	margin-bottom: 10px;
	padding: 20px;
}
</style>
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
				&nbsp; <span id="pagetitle">Vendor Registration</span>
			</h4>
			<section class="h-100 h-custom" style="background-color: #8fc4b7;">
				<div class="container py-5 h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-lg-8 col-xl-6">
							<div class="card rounded-3">
								<img src="images/registrationImg.webp" class="w-100"
									style="border-top-left-radius: .3rem; border-top-right-radius: .3rem; width: 100%;"
									alt="Sample photo">
								<div class="card-body p-4 p-md-5">
									<h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Registration
										Info</h3>

									<form class="px-md-2" action="RegisterSrv" method="post">
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline mb-4">
													<label class="form-label" for="form3Example1q">Vendor
														Name</label> <input type="text" id="form3Example1q"
														class="form-control" name="vname" required="required" />
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline mb-4">
													<label class="form-label" for="form3Example1q">Email
														Id</label> <input type="email" id="form3Example1q"
														class="form-control" name="vemail" required="required" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline mb-4">
													<label class="form-label" for="form3Example1q">Mobile
														Number</label> <input type="tel" id="form3Example1q"
														class="form-control" name="vmob" required="required" />
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline datepicker">
													<label for="exampleDatepicker1" class="form-label">Address
													</label> <input type="text" class="form-control" name="vaddr"
														required="required" id="exampleDatepicker1" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline datepicker">
													<label for="exampleDatepicker1" class="form-label">Company
													</label> <input type="text" class="form-control"
														id="exampleDatepicker1" name="cname" required="required" />
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline datepicker">
													<label for="exampleDatepicker1" class="form-label">password
													</label> <input type="password" class="form-control"
														id="exampleDatepicker1" name="vpass" required="required" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline datepicker">
													<label for="exampleDatepicker1" class="form-label">Confirm
														Password </label> <input type="password" class="form-control"
														id="exampleDatepicker1" name="cpass" required="required" />
												</div>
											</div>
										</div>
										<br> <br>
										<div style="text-align: center;">
											<button type="submit" class="btn btn-success btn-lg mb-1">Register</button>
										</div>
										<br> <br>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>