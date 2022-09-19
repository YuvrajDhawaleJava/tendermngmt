
<div class="menubar secondnav ">
	<div id="menucontent" class="container secondnav">
		<div id="collapsable-nav"
			class="collapse navbar-collapse hidden-lg hidden-md">
			<ul id="nav-list" class="nav navbar-nav navbar-left pull-left">
				<li id="navHomeButton"><a href="index.jsp"> <span
						class="glyphicon glyphicon-home"></span> Home
				</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight"> <!--Dropdown under tender category -->
						Tenders <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="vendorViewTender.jsp">View all Tenders</a></li>
						<li><a href="loginFailed.jsp">Apply for a Tender</a></li>
						<li><a href="loginFailed.jsp">Bid Approval Status</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">Vendors
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="loginFailed.jsp">List of vendors</a></li>
						<li><a href="loginFailed.jsp">Approval Status</a></li>
						<li><a href="loginFailed.jsp">Search Vendor</a></li>
					</ul></li>

				<li><a href="register.jsp">Register</a></li>

				<li>
					<!-- Form for searching any tenders or items-->
					<form class="navbar-form hidden-xs" action="vendorSearchTender.jsp">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Find Tenders by name" style="margin-left: 150px;"
								required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form> <!--End of form section-->
				</li>
			</ul>
		</div>
	</div>
</div>
