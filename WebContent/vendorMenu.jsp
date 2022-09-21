
<div class="menubar secondnav">
	<div id="menucontent" class="container secondnav">
		<div id="collapsable-nav"
			class="collapse navbar-collapse hidden-lg hidden-md">
			<ul id="nav-list" class="nav navbar-nav navbar-left pull-left">
				<li id="navHomeButton"><a href="vendorHome.jsp"> <span
						class="glyphicon glyphicon-home"></span> Home
				</a></li>
				<li><a href="vendorHome.jsp">About Us</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">
						Tenders <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="vendorViewTender.jsp">View all Tenders</a></li>
						<li><a href="bidTender.jsp">Bid for a Tender</a></li>
						<li><a href="bidHistory.jsp">Bidding History</a></li>
						<!-- <li><a href="bidHistory.jsp">Bid Status</a></li> -->
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">Account
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="viewProfile.jsp">View Profile</a></li>
						<li><a href="updateProfile.jsp">Update Profile</a></li>
						<li><a href="updatePassword.jsp">Change Password</a></li>
						<li><a href="LogoutSrv">Logout</a></li>
					</ul></li>
				<li>
					<form class="navbar-form hidden-xs" action="vendorSearchTender.jsp">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Find Tenders by Name or TenderId"
								style="margin-left: 120px;" required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
</div>