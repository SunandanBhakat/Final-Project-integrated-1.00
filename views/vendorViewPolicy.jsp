<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Way 2 Policy</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	
	<!-- Spring Csss and Images -->

  <spring:url value="/res/static/styles/style1.css" var="style1Css" />
   <link href="${style1Css}" rel="stylesheet" />
  <spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss and Images -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
</head>
<body background="/Way2Policy/res/static/images/bgv.jpg">

<c:url var="listAllPoliciesAction" value="/vendor/list"></c:url>
	<c:url var="homeAction" value="/vendorPanel"></c:url>
	<c:url var="logoutAction" value="/logout"></c:url>
	<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-dark" style="background-color:#000000;opacity: 0.7;">
					<a class="navbar-brand">
							<img src="images/logo.png" width="50" height="50" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
					  <span class="navbar-toggler-icon"></span>
					</button>
	
					<div class="collapse navbar-collapse" id="navbarColor01">
					  <ul class="navbar-nav mr-auto">
						<li class="nav-item active">
						  <a class="nav-link" href="${homeAction}">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item active">
						  <a class="nav-link" href="${listAllPoliciesAction}">List Policy <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item active">
								<a class="nav-link" href="#">${adminname} <span class="sr-only">(current)</span></a>
							</li>
					  </ul>
					  <ul class="navbar-nav">
							<li class="nav-item dropdown" >
								
								<button class="btn btn-lg btn-secondary" onclick="window.location.href='${logoutAction}'">Logout</button>
							
							</li>
							
						</ul>
					</div>
				  </nav>
		
	<div class="row"><p></p></div>
	
	
	<div class="row"><div class="col-md-2">
								<div class="card mb-4" style=" background-color: #000000;
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
		
		<div class="col-md-9">
			<br><br>
			<div class="row">
				  <div class="col-md-3">
				  
				  <form class="form" id="head1"  style="margin-left: 200px">
<!-- 				<div class="input-group add-on">
				<input class="form-control" placeholder="Product Name/ID" id="search1" onkeyup="catfunct()" type="text">
				<div class="input-group-btn">
				<button type="submit" class="btn btn-default" id="searchbtn1">
				<i class="glyphicon glyphicon-search"></i>
				</button>
				</div>
				</div> -->
				</form>
				  </div>
				  <div class="col-sm-2">
				 <!--  <div class="dropdown" id="cdrop1">
					<button class="btn btn-default dropdown-toggle" id="dropbtn1" type="button" data-toggle="dropdown"  style="margin-left: 200px">Sort By
					<span class="caret"></span></button>
					<ul class="dropdown-menu">
					  <li onclick="sorttablelowtohigh()" style="cursor:pointer; padding-left:20px;">low-high</li>
					  <li onclick="sorttablehightolow()" style="cursor:pointer; padding-left:20px;">high-low</li>
					  <li onclick="sorttablerandom()" style="cursor:pointer; padding-left:20px;">popularity</li>
					</ul>
				  </div> -->
				  </div>
				  <div class="col-sm-3"></div>
				  <div class="col-sm-2">
				  <form action="vendorAddPolicy" id="btnform2">
				<button type="submit" id="addpro" class="btn"  style="margin-left: 200px"><span>Add Policy</span></button>
				</form>
				  </div>
					</div>
					<div class="container"  style="margin-left: 300px">
							<div class="row">
								<div class="col-md-12">
									<div class="jumbotron" style="height:25px">
										<h2>List All Policies</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
					
									<c:url var="editAction" value="/vendor/edit"></c:url>
									<c:url var="removeAction" value="/vendor/remove"></c:url>
									
					
									<div class="alert alert-info" role="alert">
										<h4 class="alert-heading">${count} record(s) found.</h4>
									</div>
						<table class="table table-striped " id="tab1" style="text-align: center" >
					<thead>
					  <tr>
						<th scope="col">Policy#</th>
						<th scope="col">Policy Name</th>
						<th scope="col">Type of Policy</th>
						<th scope="col"></th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach items="${policies}" var="policy">
					  <tr>
						<td scope="row">${policy.id}</td>
						<td>${policy.policyName}</td>
						<td>${policy.policyType}</td>
						<td colspan="2"><a class="btn btn-warning btn-sm"
							href="${editAction}/${policy.id}">Edit Policy</a>&nbsp;&nbsp; <a
							class="btn btn-danger btn-sm"
							href="${removeAction }/${policy.id}">Remove Policy</a></td>

					  </tr>
					  </c:forEach>
					</tbody>
				  </table>
	</div>
</div>
</body>
</html>