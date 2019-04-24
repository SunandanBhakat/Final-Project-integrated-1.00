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

<!-- Spring Css and Images -->

<spring:url value="/res/static/styles/style1.css" var="style1Css" />
<link href="${style1Css}" rel="stylesheet" />
<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Css and Images -->

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<body background="/Way2Policy/res/static/images/bgv.jpg">

<c:url var="listAllPoliciesAction" value="/vendor/list"></c:url>
<c:url var="cancelAction" value="/vendor/list"></c:url>
	<c:url var="homeAction" value="/vendorPanel"></c:url>
	<c:url var="logoutAction" value="/logout"></c:url>
	
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#000000;opacity: 0.7;">
			<a class="navbar-brand" href="${homeAction}"> <img src="images/logo.png"
				width="30" height="30" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="${homeAction}">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item active"><a class="nav-link" href="${listAllPoliciesAction}">Policy
							List <span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<button class="btn btn-lg btn-success" onclick="window.location.href='${logoutAction}'">Logout</button>
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
			</div>
			<div class="col col-md-offset-2 col-md-2"></div>


			<div class="col col-md-offset-2 col-md-7">
				<!--Form begins here-->
<c:url var="updateAction" value="/vendor/update"></c:url>
     <form:form method="post" action="${updateAction}" commandName="updatePolicy">

				<div class="row">
					<h1 id="containers">Edit Policy Details:</h1>
				</div>
				<div class="row">
					<div class="col-md-4">
						
						
						<div class="form-group">
								<form:label path="id">Policy ID</form:label>
								 <form:input type="text" class="form-control" path="id" value="${updatePolicy.id}" readonly="true" style="background-color: #BDBDBD;" />
							</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="companyName">Company Name</form:label> <form:input type="text"
								class="form-control" value="${updatePolicy.companyName}" path="companyName" required="required" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="policyName">Policy Name</form:label> <form:input type="text"
								class="form-control" value="${updatePolicy.policyName}" path="policyName" required="required" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="durationOfPolicy">Duration in Years</form:label> <form:select class="custom-select" path="durationOfPolicy" value="${updatePolicy.durationOfPolicy}"
								required="required">
								<form:option value="0">Choose Policy Tenure</form:option>
								<form:option value="1">One</form:option>
								<form:option value="2">Two</form:option>
								<form:option value="3">Three</form:option>
								<form:option value="4">Four</form:option>
								<form:option value="5">Five</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="initialDeposit">Initial Deposit</form:label> <form:input type="text" name="initialDeposit" path="initialDeposit" value="${updatePolicy.initialDeposit}"
								class="form-control" />
						</div>
					</div>

					<div class="col-md-4">
						<div class="form-group">
							<form:label path="interest">Interest Rate</form:label> <form:input type="text"
								path="interest" value="${updatePolicy.interest}" class="form-control" />
						</div>
					</div>
					
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="termAmount">Term Amount</form:label> <form:input type="text" name="termamount" path="termAmount" value="${updatePolicy.termAmount}"
								class="form-control" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<form:label path="policyType">Policy Type</form:label> <form:input type="text"
								path="policyType" value="${updatePolicy.policyType}" class="form-control" />
						</div>
					</div>
					</div>




				
				<!--<button class="logo1" data-toggle="modal" data-target="#exampleModalCenter" style="width:100%; border-radius:50px; background-color:#bfbfbf; padding:5px; margin-top: 0; color:#666666; font-size: 12px;">Pay</button>-->
				<button type="submit" class="btn btn-primary btn-lg"
					style="margin-left: 200px; margin-top: 50px;" name="updatepolicy"
					value="update_policy">Save Changes</button>
				<button class="btn btn-lg btn-danger" onclick="window.location.href='${cancelAction}'" style="margin-top:50px;">Cancel</button>
				
            </form:form>

			</div>
			
		</div>
							
	</div>
</body>
</html>