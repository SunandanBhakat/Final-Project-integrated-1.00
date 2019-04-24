<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Way 2 Policy User Login Form</title>
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link href='<spring:url value="/res/static/styles/indexstyle.css" />'
	rel="stylesheet" />
<link href="<spring:url value='/res/static/styles/bootstrap.min.css' />"
	rel="stylesheet" />
<link href="<spring:url value='/res/static/styles/custom.css' />"
	rel="stylesheet" />

<spring:url value="/res/static/images" var="images" />

<!-- End Spring Css, Scripts and Images -->
<style>
	a.badge{
		font-size:11pt;
		margin-bottom:0px;
	}
</style>

</head>
<body>

	<div class="top-header section-bg">
		<div class="verticle-center">
			<div class="container">
				<div class="row">
					<div class="display-flex">
						<div class="col-lg-7 col-md-6">

							<h2 class="display-3">User Login</h2>
							<p class="pg">Welcome user, please provide your login
								credentials.</p>
							<form:form action="userLoginCheck" method="post"
								class="needs-validation" novalidate="true"
								modelAttribute="userCheck">
								<div class="form-group">
									
									<form:input path="emailId" type="email" name="username"
										class="form-control txt" required="required" autocomplete="off" placeholder="email" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="form-group">
									
									<form:input path="password" type="password" name="password"
										class="form-control txt" required="required" autocomplete="off" placeholder="password" id="myInput"/>
										<input type="checkbox" class="custom-control-label" onclick="myFunction()" name="checkbox"/>Show Password
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<c:if test="${loginStatus eq -2 }">
									<div class="alert alert-dismissible alert-danger">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<strong>Error!</strong> Password Mismatch.
									</div>
								</c:if>
								<c:if test="${loginStatus eq -1 }">
									<!-- <div class="form-group"> -->
									<div class="alert alert-dismissible alert-danger">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<strong>Error!</strong> Invalid User Name.
									</div>

								</c:if>

								<div class="button-group">
									<button type="submit" name="loginadmin"
										class="btn btn-info btn-new-bg btn-lg">LOGIN</button>
								</div>
								<div class="button-group">
									<a class="badge badge-primary"
										href="<c:url value="/newUserRegistration" />">New User?
										Register Here</a><br> <a class="badge badge-danger"
										href="<c:url value="/forgotPassword" />">Forgot Password?</a>
								</div>
							</form:form>


						</div>
						<div class="col-lg-5 col-md-6">
							<img src="${images}\logo.png" alt="logo" class="img-circle" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script type="text/javascript"
		src='<spring:url value="/res/static/scripts/index.js"/>'>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js">
	</script>

	<script>
		// Disable form submissions if there are invalid fields
		(
				function() {
					'use strict';
					window.addEventListener('load', function() {
						// Get the forms we want to add validation styles to
						var forms = document.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
				})();
	</script>
	<script>
function myFunction() {
  var x = document.getElementById("myInput");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>


</body>
</html>