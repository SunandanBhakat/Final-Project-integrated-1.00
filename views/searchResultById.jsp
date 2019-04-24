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
		<spring:url value="/res/static/styles/style1.css" var="style1Css" />
	<link href="${style1Css}" rel="stylesheet" />
	

	<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
</head>
<body id="body">
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
		
	<div class="row"><p></p></div>
	
	<div class="row">
	
		
			<div class="col-md-7">
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


		
		<div class="col col-md-offset-2 col-md-9" >
			<!--Form begins here-->
			<c:url var="searchResultAction" value="/user/buyPolicyId"></c:url>
 
				<form:form method="post" action="${searchResultAction}" commandName="searchPolicyResult">	
					
					<!-- <div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Term Amount</label>
								<input type="text" class="form-control" readonly />
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Fine Amount</label>
								<input type="text" class="form-control" readonly />
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label>Total Amount to be Paid:</label>
								<input type="text" class="form-control" readonly/>
							</div>
						</div>
						
					</div> -->
										<div class="row" style="margin-left:450px;">
						<h1 id="containers">Your Search Result:</h1>
					</div>

				

					<div class="row" style="margin-left:450px;">
						<div class="col-md-11">
							<div class="form-group">
								<form:label path="id">Policy ID</form:label>
								<form:input type="text" class="form-control" path="id" value="${searchPolicyResult.id}" readonly="true" style="background-color: #BDBDBD;" />
							</div>
						</div>
						<div class="col-md-11">
							<div class="form-group">
								<form:label path="companyName">Company Name</form:label>
								<form:input type="text" class="form-control" value="${searchPolicyResult.companyName}" path="companyName" required="required" readonly="true" style="background-color: #BDBDBD;"  />
							</div>
						</div>
					</div>	
					<div class="row" style="margin-left:450px;">
						<div class="col-md-11">
							<div class="form-group">
								<form:label path="policyName">Policy Name</form:label>
								<form:input type="text"
								class="form-control" value="${searchPolicyResult.policyName}" path="policyName"  readonly="true" style="background-color: #BDBDBD;" />
							</div>
						</div>
						<div class="col-md-11">
							<div class="form-group">
								<form:label path="durationOfPolicy">Term Duration</form:label>
								<form:input type="text"
								class="form-control" value="${searchPolicyResult.durationOfPolicy}" path="durationOfPolicy"  readonly="true" style="background-color: #BDBDBD;" />
							</div>
						</div>
					</div>	
					<div class="row" style="margin-left:450px;">
						<div class="col-md-11">
							<div class="form-group">
								<form:label path="termAmount">Term Amount</form:label>
								<form:input type="text"
								class="form-control" value="${searchPolicyResult.termAmount}" path="termAmount"  readonly="true" style="background-color: #BDBDBD;" />
							</div>
						</div>

						<div class="col-md-11">
							<div class="form-group">
								<form:label path="initialDeposit">Initial Deposit</form:label>
								<form:input type="text"
								class="form-control" value="${searchPolicyResult.initialDeposit}" path="initialDeposit"  readonly="true" style="background-color: #BDBDBD;" />
							</div>
						</div>				
					<%-- <div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="termAmount">Total Amount to be Paid</form:label>
								<form:input type="text"
								class="form-control" value="${searchPolicyResult.initialDeposit}" path="initialDeposit"  readonly="true"/>
							</div>
						</div>
					
					</div> --%>
					


					
					
					<!--<button class="logo1" data-toggle="modal" data-target="#exampleModalCenter" style="width:100%; border-radius:50px; background-color:#bfbfbf; padding:5px; margin-top: 0; color:#666666; font-size: 12px;">Pay</button>-->
					
					<button type="submit" name="buy" value="buy" class="btn btn-success btn-lg" style="margin-left:100px;">Buy Policy</button>
					
				</form:form>	
		</div>
	</div>
</div>
</div>
</div>

</body>
</html>