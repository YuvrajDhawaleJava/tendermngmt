
<div class="menubar secondnav ">
	<div id="menucontent" class="container secondnav">
		<div id="collapsable-nav"
			class="collapse navbar-collapse hidden-lg hidden-md">
			<ul id="nav-list" class="nav navbar-nav navbar-left pull-left">
				<li id="navHomeButton"><a href="adminHome.jsp"> <span
						class="glyphicon glyphicon-home"></span> Home
				</a></li>
				<li><a href="adminViewVendor.jsp">Vendors</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">
						Tender <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="viewTender.jsp">View all Tenders</a></li>
						<li><a href="createTender.jsp">Create New Tender</a></li>
						<li><a href="viewTenderBids.jsp">View Tender Bids</a></li>
						<li><a href="viewAssignedTenders.jsp">View Assigned
								Tenders</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle "
					data-toggle="dropdown"
					data-animations="fadeIn fadeInLeft fadeInUp fadeInRight"
					data-hover="dropdown">Notice <span class="caret"></span></a> <!--Dropdown under about us category -->
					<ul class="dropdown-menu">
						<li><a href="addNotice.jsp">Add Notice</a></li>
						<li><a href="removeNotice.jsp">Remove Notice</a></li>
						<li><a href="updateNotice.jsp">Update Notice</a></li>
						<li><a href="viewNotice.jsp">View All Notice</a></li>
					</ul></li>
				<li><a href="LogoutSrv">Logout</a></li>
				<li>
					<form class="navbar-form hidden-xs" action="searchTender.jsp">
						<div class="form-group">
							<input type="text" name="tid" class="form-control"
								placeholder="Find Tenders by name or tenderId"
								style="margin-left: 10px;" required>
						</div>
						<button type="submit" class="btn btn-primary">Search</button>
					</form>
				</li>
			</ul>
		</div>
	</div>
</div>