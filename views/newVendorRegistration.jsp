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
	<title>newVendorRegistration</title>
	<link rel="stylesheet" href="styles/bootstrap.min.css" type="text/css">
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	
	<link rel="stylesheet" href="styles/style1.css" type="text/css">
	
	<script src="<c:url value="/res/static/scripts/valid.js" />"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<!-- Spring Csss, Scripts and Images -->

<spring:url value="/res/static/styles/style1.css" var="style" />
<link href="${style}" rel="stylesheet" />
<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss, Scripts and Images -->
	
</head>
<body id="body">
	
	<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
					<a class="navbar-brand" href="http://localhost:8090/Way2Policy/">
							<img src="${images}/logo.png" width="70" height="50" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
					  <span class="navbar-toggler-icon"></span>
					</button>
				  </nav>
		
	<div class="row"><p></p></div>
	
	<div class="row">
	<!--Card begins here-->
		
		<div	class="col col-md-offset-2 col-md-2" ></div>

	
				
			
				
					<!--Input Fields begins here-->
		<div class="col col-md-offset-2 col-md-7" style="margin-left: 200px;">
			<!-- Form begins here!-->
			<c:url var="saveVendor" value="/vendor/register/"></c:url>
				<form:form method="post" id="form" modelAttribute="newVendorAdd" action="${saveVendor}">
			<!-- Condition Checker Begins -->
			<c:if test="${commit eq true }">
					<div class="form-group">
						<div class="alert alert-success alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Success!</strong> New Vendor Registered Successfully..
							<p>Your New id is: ${id}. Please Remember it for Future Login.</p>
						</div>
					</div>
				</c:if>
				
					<c:if test="${commit eq false }">
					<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Error!</strong> Vendor Cannot be Registered due to Server Problem. Please try again, later.
							<p>${message}</p>
						</div>
					</div>
				</c:if>
				
				<!-- Condition Checker Ends -->
						<div class="row">
								
								<div class="col-sm-8">
									<div class="form-group">
										<h2>Vendor Details</h2>
									</div>
								</div>
							</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="firstName"><font size="4">First Name</font></form:label>
								<form:input type="text" class="form-control"  id="firstName" path="firstName" required="required" />
								<font id="firstNameError" style="color: red;"></font>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="companyEmail"><font size="4">Company Email</font></form:label>
								<form:input path="companyEmail" type="text" class="form-control" required="required" id="companyEmail"/>
								<font id="companyEmailError" style="color: red;"></font>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="LastName"><font size="4">Last Name</font></form:label>
								<form:input type="text" class="form-control" id="lastName" path="LastName" required="required"  />
								<font id="lastNameError" style="color: red;"></font>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="companyName"><font size="4">Company Name</font></form:label>
								<form:input path="companyName" type="text" class="form-control" required="required"/>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="gender"><font size="4">Gender</font></form:label>
								<p>
									<form:input path="gender" type="radio" name="gender" value="Male" checked="checked"/>
									<form:label path="gender"> Male</form:label>
									<form:input path="gender" type="radio" name="gender" value="Female"/>
									<form:label path="gender">Female</form:label></p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="tan"><font size="4">Tan No.</font></form:label>
								<form:input path="tan" type="text" class="form-control" id="tanId" required="required"/>
								<font id="tanIdError" style="color: red;"></font>
							</div>
						</div>
					</div>	
					<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<form:label path="contact"><font size="4">Contact No.</font></form:label>
									<form:input type="tel" class="form-control" id="contact" path="contact" required="required"  />
									<font id="contactError" style="color: red;"></font>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<form:label path="password"><font size="4">Password</font></form:label>
									<form:input type="password" class="form-control" id="password" path="password" required="required" />
									<font id="passwordError" style="color: red;">${passwordError}</font>
								</div>
							</div>
						</div>
						<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<form:label path="age"><font size="4">Age</font></form:label>
										<form:input type="text" path="age" class="form-control" required="required"  pattern="[0-9]{2}"  oninvalid="this.setCustomValidity('Please enter valid age')"
 oninput="setCustomValidity('')" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label id="confirmPassword"><font size="4">Confirm Password</font></label>
										<input type="password" class="form-control" id="confirmPassword" required="required" />
										<font id="confirmPasswordError" style="color: red;"></font>
									</div>
								</div>
							</div>
									<br>
									
						<button type="submit" class="btn btn-primary btn-lg" style="margin-left: 100px"  onclick="return validate()">Submit</button>
						
					
					<button type="reset" class="btn btn-primary btn-lg" style="margin-left: 200px">Reset</button>
				</form:form>	
		</div>
	</div>
</div>
</body>
</html>