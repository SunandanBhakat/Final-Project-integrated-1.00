
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Way 2 Policy</title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

<!-- Spring Csss and Images -->

<spring:url value="/res/static/styles/style1.css" var="style1Css" />
<link href="${style1Css}" rel="stylesheet" />
<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss and Images -->


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>

<body background="/Way2Policy/res/static/images/bgv.jpg">
<c:url var="listAllPoliciesAction" value="/vendor/list"></c:url>
	<c:url var="homeAction" value="/vendorPanel"></c:url>
	<c:url var="logoutAction" value="/logout"></c:url>

	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#000000;opacity: 0.7;">
			<a class="navbar-brand" href="${homeAction}"> <img
				src="${images}/logo.png" width="30" height="30" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<%-- <c:url var="listAllPoliciesAction" value="/vendor/list"></c:url>
			<c:url var="homeAction" value="/"></c:url> --%>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${homeAction}">Home <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item active"><a class="nav-link"
						href="${listAllPoliciesAction}">List Policy <span
							class="sr-only">(current)</span></a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<button class="btn btn-lg btn-success"
							onclick="window.location.href='${logoutAction}'">Logout</button>
					</li>

				</ul>
			</div>
		</nav>


		<div class="row">
			<p></p>
		</div>

		<div class="row">
			<div class="card mb-3" style=" background-color: #000000;
  opacity: .5;">
						<h3 class="card-header">Hey!</h3>
						<div class="card-body">
						   <h5 class="card-title">${sessionScope.vendorData.firstName}&nbsp;&nbsp;${sessionScope.vendorData.lastName}</h5>
						 
						<h5 class="card-title">GENDER: ${sessionScope.vendorData.gender}</h5>
						<h5 class="card-title">AGE: ${sessionScope.vendorData.age}</h5>
						<h5 class="card-title">EMAIL: ${sessionScope.vendorData.companyEmail}</h5>
						<h5 class="card-title">CONTACT: ${sessionScope.vendorData.contact}</h5>
						</div>
						<!-- <img style="height: 200px; width: 100%; display: block;" class="img img-circle"
							src="images/userimg.jpg" alt="Card image"> -->
						<div class="card-body">
						
						</div>
						
						
						<div class="card-footer" style="color: #e6b800;">You are logged in</div>
					  </div>
			

		<div class="col-md-2">
				<div class="container"
					style="padding-top: 200px; margin-left: 200px;">
					<div class="row">
						<div class="col-md-3">


							<form action="vendorAddPolicy">
								<button class="button" type="submit"
									style="border-radius: 8.5rem">
									<img src="${images}/a2.jpg" height="320px" width="320px"
										style="border-radius: 8.5rem">
								</button>

							</form>

						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3">

							<form action="vendorEditPolicy">
								<button class="button"
									style="border-radius: 8.5rem; margin-left: 400px;">
									<img src="${images}/e2.jpg" height="320px" width="320px"
										style="border-radius: 8.5rem;">
								</button>
							</form>
						</div>

					</div>
					<div class="row">

						<div class="col-md-3">
							<p>
								<h1
									style="color: rgb(212,175,55); font-weight: bold; text-align: center; margin-left: 110px; font-size: 50px;font-family:Brush Script MT ;">AddPolicy</h1>
							</p>
						</div>
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<p>
								<h1
									style="color: rgb(197,179,88); font-weight: bold; text-align: center; margin-left: 500px; font-size: 50px; font-family:Brush Script MT ;">EditPolicy</h1>
							</p>
						</div>
					</div>
				</div></div>
		</div>
</div>
	</div>
	</div>
</body>

</html>