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
	<title>newUserRegistration</title>
	
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	
	
	
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
	<script src="<c:url value="/res/static/scripts/validation.js" />"></script>
	
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
				<c:url var="saveUser" value="/user/register/"></c:url>
				<form:form method="post" id="form" modelAttribute="newUserAdd" action="${saveUser}">
				<!-- Condition Checker Begins -->
			
				<c:if test="${commit eq false }">
					<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Error!</strong> Email Id already Registered. Please Use another Email and Try Again.
							<p>${message}</p>
						</div>
					</div>
				</c:if>
			
			
			<!-- Condition Checker Begins -->
						<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<h2>Personal Details</h2>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<h2>Employer Details</h2>
									</div>
								</div>
							</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="firstName"><font size="4">First Name</font></form:label>
								<form:input type="text" class="form-control" id="firstName" path="firstName" required="required" />
								<font id="firstNameError" style="color: red;"></font>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="employerType"><font size="4">Employer Type</font></form:label>
								<form:input path="employerType" type="text" class="form-control" required="required"/>
							</div>
						</div>
					</div>	
					
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
							<form:label path="lastName"><font size="4">Last Name</font></form:label>
								<form:input type="text" class="form-control" id="lastName" path="lastName" required="required" />
								<font id="lastNameError" style="color: red;"></font>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="employerName"><font size="4">Employer Name</font></form:label>
								<form:input path="employerName" type="text" class="form-control" required="required"/>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path=""><font size="4">Gender</font></form:label>
								<p>
									<form:input path="gender" type="radio" name="gender" value="Male" checked="checked"/>
									<form:label path="gender">Male</form:label>
									<form:input path="gender" type="radio" name="gender" value="Female"/>
									<form:label path="gender">Female</form:label></p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="salaryPerMonth"><font size="4">Salary Per Month</font></form:label>
								<form:input path="salaryPerMonth" type="number" class="form-control" required="required"/>
							</div>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="address"><font size="4">Address</font></form:label>
								<form:input type="text" id="address" path="address" class="form-control" required="required" />
								<font id="addressError" style="color: red;"></font>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
									<form:label path="qualification"><font size="4">Education</font></form:label>
								   <p>
								   <form:select path="qualification" class="custom-select">
									  <form:option value="none" path="qualification">select</form:option>
								  	<form:option value="Secondary" path="qualification">Secondary</form:option>
								  	<form:option value="Higher Secondary" path="qualification">Higher Secondary</form:option>
								  	<form:option value="Under Graduation" path="qualification">Under Graduation</form:option>
								  	<form:option value="Post Graduation" path="qualification">Post Graduation</form:option>
								   </form:select></p>
							</div>
						</div>
					</div>
					<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<form:label path="contactNo"><font size="4">Contact No.</font></form:label>
									<form:input type="tel" id="contact" path="contactNo" class="form-control" required="required" />
									<font id="contactError" style="color: red;"></font>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<form:label path="password"><font size="4">Password</font></form:label>
									<form:input type="password" id="password" path="password" class="form-control" required="required"/>
									<font id="passwordError" style="color: red;">${passwordError}</font>
								</div>
							</div>
						</div>
						<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<form:label path="pan"><font size="4">PAN No.</font></form:label>
										<form:input path="pan" type="text" class="form-control" required="required" />
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label path="confirmPassword"><font size="4">Confirm Password</font></label>
										<input type="password" id="confirmPassword" path="confirmPassword" class="form-control" required="required"/>
										<font id="confirmPasswordError" style="color: red;"></font>
									</div>
								</div>
							</div>
							<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<form:label path="emailId"><font size="4">Email id</font></form:label>
											<form:input id="email" path="emailId" type="email" class="form-control" required="required" />
											<font id="emailError" style="color: red;">${emailExistError} </font>
										</div>
									</div>
									<div class="col-md-4">
											<div class="form-group">
													<form:label path="hintQuestion"><font size="4">Hint Question</font></form:label>
													 <p>
													 <form:select path="hintQuestion" class="custom-select">
														<option disabled value="none" selected>select</option>
														<option value="nickname">What was your childhood nickname?</option>
														<option value="movie">What is your favorite movie?</option>
														<option value="hospital">What was the name of the hospital where you were born?</option>
														<option value="school">What school did you attend for sixth grade?</option>
													 </form:select></p>
											</div>
										</div>
								</div>	
								<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<form:label path="dob"><font size="4">DOB</font></form:label>
												<p>
													<form:input path="dob" type="date" name="dateofbirth" id="dateofbirth"/>
												</p>
													
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<form:label path="hintAnswer"><font size="4">Hint Answer</font></form:label>
												<form:input path="hintAnswer" type="text" class="form-control" required="required"/>
											</div>
										</div>
									</div>
									<%-- <div class="row">
											<div class="col-md-4">
												<div class="form-group">
													<form:label path="userType"><font size="4">User Type</font></form:label>
													<br>
															<form:select path="userType" class="custom-select">
															   <option disabled value="none" selected>select</option>
															   <option value="student">Student</option>
															   <option value="employee">Employee</option>
															   <option value="retired">Retired</option>
															   </form:select>
												</div>
											</div>
											<div class="col-md-4">

											</div>
									</div> --%>
									<br>
									
						<button type="submit" class="btn btn-primary btn-lg" style="margin-left: 270px"  onclick="return validate()">Submit</button>
						
					
					<button type="reset" class="btn btn-primary btn-lg" style="margin-left: 50px">Reset</button>
				</form:form>	
		</div>
	</div>
</div>
</body>
</html>