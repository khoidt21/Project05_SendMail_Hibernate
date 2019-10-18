<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no"
>
<meta name="description" content="">
<meta name="author" content="">
<title>News</title>
<!-- Custom fonts for this theme -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css"
>
<link href="vendor/fontawesome-free/css/css1.css" rel="stylesheet"
	type="text/css"
>

<script src="vendor/jquery/tinymce.js"></script>

<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css"
>
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css"
>
<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav"
	>
		<div class="container">
			<%
				if (session.getAttribute("username") == null) {
					response.sendRedirect("login.jsp");
				}
				String username = (String) session.getAttribute("username");
			%>
			<button
				class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation"
			>
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="post.jsp"
					>Tin tức</a></li>
					<li class="nav-item mx-0 mx-lg-1" id="menu-item"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="UserControllerServlet"
					>QL Tài khoản</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="NewControllerServlet"
					>QL Tin tức</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="sendemail.jsp"
					>Send Mail</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="listmail.jsp"
					>List Mail</a></li>				
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="LogOutServlet"
					>Thoát</a></li>
					
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="#"
					>TK : <%=username%></a></li>
				</ul>
			</div>
		</div>
	</nav>