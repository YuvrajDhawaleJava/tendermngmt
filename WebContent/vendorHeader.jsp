<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<link rel="shortcut icon" type="image/png" href="images/mibsLogo.png">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tender Management System</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/annimate.css">
<link href="css/font-awesome.min.css" type="text/css" rel="stylesheet">
<link href="css/SpryTabbedPanels.css" type="text/css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Ops+One"
	rel="stylesheet">
<link href="css/bootstrap-dropdownhover.min.css">
<link rel="stylesheet" href="css/style1.css">
</head>
<body>
	<nav class="navbar navbar-inverse"> <!-- Navigation Bar-->
	<div class="container">
		<div class="navbar-header">
			<a href="#" class="pull-left"> <img src="images\mibsLogo.png"
				alt="HIT Haldia" width="70px" height="70px" />
			</a> <a class="navbar-brand" href="#"><h1>Tender Management
					System</h1></a> <a href="https://mibspune.in/"><p>&nbsp P. E.
					Society's Modern Institute Of Business Studies (MIBS)</p></a>
		</div>
		<ul class="nav navbar-nav navbar-right menusize pull-right">
			<li><a href="register.jsp"><span
					class="glyphicon glyphicon-user "></span>SignUp</a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</ul>
		<div class="navbar-header pull-left hidden-lg hidden-md">
			<button id="navbarToggle" type="button"
				class="btn btn-primary navbar-toggle collapsed"
				data-toggle="collapse" data-target="#collapsable-nav"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
	</div>
	<jsp:include page="vendorMenu.jsp"></jsp:include>
	<div class="clearfix hidden-sm hidden-xs"
		style="color: #ccddff; background-color: #476b6b; margin-top: -7px; margin-bottom: 10px;">
		<marquee>Welcome to Tender Management Site</marquee>
	</div>
	</nav>

	<script src="js/jquery-2.1.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/ajax-utils.js"></script>
	<script src="js/script.js"></script>
	<script src="js/bootstrap-dropdownhover.min.js"></script>