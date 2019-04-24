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



<spring:url value="/res/static/styles/style1.css" var="style1Css" />

<link href="${style1Css}" rel="stylesheet" />


<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />

<link href="${bootstrapCss}" rel="stylesheet" />

<spring:url value="/res/static/images" var="images" />







<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>



</head>

<body id="body">
<%response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0); %>



<c:if test="${userData.emailId==null}">
<%response.sendRedirect("/Way2Policy/"); %>
</c:if>

	<c:url var="listAllMyPoliciesAction" value="/user/myPolicy"></c:url>
	<c:url var="homeAction" value="/userPanel"></c:url>
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
						href="${listAllMyPoliciesAction}">My Policy <span
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
		    <div class="col-md-3">
				<div class="card mb-2" style=" background-color: #000000;
  opacity: .5;">
						<h3 class="card-header">Hey!</h3>
						<div class="card-body">
						  <h5 class="card-title">${sessionScope.userData.firstName}&nbsp;&nbsp;${sessionScope.userData.lastName}</h5>
						 
						<h5 class="card-title">GENDER: ${sessionScope.userData.gender}</h5>
						<h5 class="card-title">DOB: ${sessionScope.userData.dob}</h5>
						<h5 class="card-title">EMAIL: ${sessionScope.userData.emailId}</h5>
						<h5 class="card-title">CONTACT: ${sessionScope.userData.contactNo}</h5>
						</div>
						<!-- <img style="height: 200px; width: 100%; display: block;" class="img img-circle"
							src="images/userimg.jpg" alt="Card image"> -->
						<div class="card-body">
						
						</div>
						
						
						<div class="card-footer" style="color: #e6b800;">You are logged in</div>
					  </div>
				
		
						
					</div>





		<div class="container" style="padding-top: 200px;">

			<div class="row">

				<!-- <div class="col-md-3"></div> -->

				<div class="col-md-3">
				
				<c:url value="${'/user/myPolicy'}"  var="myPolicyUrl"/>

					<form:form action="${myPolicyUrl}">

						<button class="button" style="border-radius: 8.5rem">

							<img src="${images}/myPolicy.png" height="220px" width="220px"
								style="border-radius: 8.5rem">

						</button>

						<p>
							<span
								style="color: rgb(255, 115, 0); font-weight: bold; text-align: center; margin-left: 70px; font-size: 25px;">My
								Policy</span>
						</p>
				</div>

				</form:form>

				<div class="col-md-3"></div>

			

			



				<form:form action="user/search">

					<button class="button" style="border-radius: 8.5rem">

						<img src="${images}/search.jpg" height="220px" width="220px"
							style="border-radius: 8.5rem">

					</button>

					<p>
						<span
							style="color: rgb(255, 115, 0); font-weight: bold; text-align: center; margin-left: 90px; font-size: 25px;">Search</span>
					</p>

				</form:form>

				<%-- <div class="col-md-3"></div>

				<div class="col-md-3">

					<div class="col-md-3"></div>

				</div>

				

					<div class="col-md-3">

						<form:form action="payment">

							<button class="button" style="border-radius: 8.5rem">

								<img src="${images}/Payment.png" height="220px" width="220px"
									style="border-radius: 8.5rem">

							</button>

							<div class="col-md-3">
								<p>
									<span
										style="color: rgb(255, 115, 0); font-weight: bold; text-align: center; margin-left: 70px; font-size: 25px;">Payment</span>
								</p>
							</div>

						</form:form>
 




						<div class="col-md-3"></div>



						<div class="col-md-3"></div>

						<div class="row">

							<div class="col-md-3"></div>

							<div class="col-md-3"></div>



						</div>
 --%>
					</div>

				</div>

			</div>

		</div>



	

</body>

</html>