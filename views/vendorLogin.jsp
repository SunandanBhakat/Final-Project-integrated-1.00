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

							<h2 class="display-3">Vendor Login</h2>
							<p class="pg">Welcome vendor, please provide your login
								credentials.</p>
			<form:form action="vendorLoginCheck" modelAttribute="vendorCheck"
				method="post">

								<div class="form-group">
									<form:input path="id" type="text" name="id"
										class="form-control txt" required="required"
										autocomplete="off" placeholder="ID" />
								</div>
								<div class="form-group">
									<form:input path="password" type="password" name="password"
										class="form-control txt" required="required"
										autocomplete="off" placeholder="password" id="myInput"/>
										<input type="checkbox" class="custom-control-label" onclick="myFunction()" name="checkbox"/>Show Password
										
								</div>





		<!-- Condition Check begins -->
			<c:if test="${loginStatus eq -2 }">
					<div class="form-group">
						<div class="alert alert-dismissible alert-danger">
									  <button type="button" class="close" data-dismiss="alert">&times;</button>
									  <strong>Error!</strong> Password Mismatch.
						</div>
					</div>
				</c:if>
                <c:if test="${loginStatus eq -1 }">
					<div class="form-group">
						<div class="alert alert-dismissible alert-danger">
									  <button type="button" class="close" data-dismiss="alert">&times;</button>
									  <strong>Error!</strong>  Invalid User Name.
									</div>
					</div>
				</c:if>
                
				
			<!-- Condition Check ends -->

				<%-- <div class="field-wrap">
					<form:label path="id">
                          Id<span class="req">*</span>
					</form:label>
					<form:input path="id" type="text" name="username"
						required="required" autocomplete="off" />
				</div>


				<div class="field-wrap">
					<form:label path="password">
                        Password<span class="req">*</span>
					</form:label>
					<form:input path="password" type="password" name="password"
						required="required" autocomplete="off" />
				</div> 
				<p class="register">
					<a href="<c:url value="/newVendorRegistration" />">New User? Register Here</a>
				</p>--%>
				
				
				<div class="button-group">
				<button type="submit" name="loginvendor" class="btn btn-info btn-new-bg btn-lg">LOGIN</button><br>
				<a class="badge badge-danger" href="<c:url value="/newVendorRegistration" />">New Vendor? Register Here</a>
				</div>
			</form:form>


		</div>
		<!-- tab-content -->
						<div class="col-lg-5 col-md-6">
							<img src="${images}\logo.png" alt="logo" class="img-circle" />
						</div>
	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script type="text/javascript"
	src='<spring:url value="/res/static/scripts/index.js"/>'></script>

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