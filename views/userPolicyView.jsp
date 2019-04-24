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
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<!-- Spring Csss and Images -->

  <spring:url value="/res/static/styles/style1.css" var="style1Css" />
   <link href="${style1Css}" rel="stylesheet" />
  <spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Css and Images -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
</head>
<body id="body">
	<!-- 	<script>
	$(document).ready( function () {
    $('#tab1').DataTable();
} );
	</script> -->
	<c:url var="listAllMyPoliciesAction" value="/user/list"></c:url>
	<c:url var="homeAction" value="/userPanel"></c:url>
	<c:url var="logoutAction" value="/logout"></c:url>
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
						href="${listAllMyPoliciesAction}">List Policy <span
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
		
	<div class="row"><p></p></div>
	
	
	<div class="row"> 
	<div class="col-md-2">
			
				<div class="card mb-1" style=" background-color: #000000;
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
	
				  </div>
				 <%--  <div class="col-sm-3"></div>
				  <div class="col-sm-2">
				  <form action="searchPolicy" id="btnform2">
				<button type="submit" id="addpro" class="btn"  style="margin-left: 200px"><span>Add Policy</span></button>
				</form>
				  </div>
					</div> --%>
					<div class="container"  style="margin-left: 300px">
							<div class="row">
								<div class="col-md-12">
									<div class="jumbotron" style="height:25px">
										<h2>My Policies</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
					
									<%-- <c:url var="editAction" value="/user/edit"></c:url>
									<c:url var="removeAction" value="/user/remove"></c:url> --%>
									
					
									<div class="alert alert-info" role="alert">
										<h4 class="alert-heading">${policyCount} record(s) found.</h4>
									</div>
						<table class="table table-striped " id="tab1" style="text-align: center" >
					<thead>
					  <tr>
						<th scope="col">PolicyRef#</th>
						<th scope="col">Company Name</th>
						<th scope="col">Policy Name</th>
						<th scope="col">Duration</th>
						<th scope="col">Policy Start Date</th>
						<th scope="col">Policy End Date</th>
						<th scope="col">Payment Method</th>
						<th scope="col">Payment Status</th>
						<th scope="col">Company Policy ID</th>
						<th scope="col"></th>
					  </tr>
					</thead>
					<tbody>
						<c:forEach items="${myPolicies}" var="policy">
					  <tr>
						<td scope="row">${policy.policyReferenceNo}</td>
						<td>${policy.companyName}</td>
						<td>${policy.policyName}</td>
						<td>${policy.duration}</td>
						<td>${policy.policyStartDate}</td>
						<td>${policy.policyEndDate}</td>
						<td>${policy.paymentMethod}</td>
						<td>${policy.paymentStatus}</td>
						<td>${policy.policyId}</td>
						<%-- <td colspan="2"><a
							class="btn btn-danger btn-sm"
							href="${removeAction }/${policy.policy_ref_no}">Unsubscribe Policy</a></td>

					  </tr> --%>
					  </c:forEach>
					</tbody>
				  </table>
				  <br>
				<%--   <div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
						
							
							<div class="modal-content">
								<div class="modal-body">
								<c:url var="listAction" value="/user/list/"></c:url>
									<form:form action="user/list" method="POST">
									<p style="color:#FF8C00">DO YOU REALLY WANT TO UNSUBSCRIBE?</p>
									<button type="button" class="btn btn-info btn-lg"  style="background-color:#FF8C00; margin-left: 100px;">YES</button>
									</form:form>
									<form>
									<button type="button" class="btn btn-default" data-dismiss="modal" style="background-color:#FF8C00; margin-left: 100px;">NO</button>
									</form>
								</div>
							</div>
							
						</div>
					</div> --%>
	</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
