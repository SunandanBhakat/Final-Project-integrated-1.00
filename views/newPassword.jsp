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
	<title>Set New Password</title>
	
	
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
				
				<c:url var="savePassword" value="/user/newPassword/"></c:url>
				<form:form method="post" modelAttribute="forgotPassword" id="form" action="${savePassword}">
				<c:if test="${saveProcess eq true }">
				<c:url var="close" value="/userLogin"></c:url>
				<div class="form-group">
						<div class="alert alert-dismissible alert-success">
							<button type="button" class="close" data-dismiss="alert" onclick="window.location.href='${close}'">&times;</button>
							<strong>Success!</strong> Password Change Successful!. 
							
						</div>
					</div>
				</c:if>
				<c:if test="${saveProcess eq false }">
				<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Error!</strong> Password Change Unsuccessful! Please Try again.
							
						</div>
					</div>
				</c:if>
				<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<h2>Personal Details</h2>
									</div>
								</div>
								
							</div>

                        <div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<form:label path="emailId"><font size="4">Email id</font></form:label>
											<form:input path="emailId" type="email" class="form-control" value="${userHint.emailId}" readonly="true" required="required" style="background-color: #BDBDBD;" />
										</div>
									</div>
									
								</div>
				
				<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<h2>Set New Password </h2>
									</div>
								</div>
								
							</div>	
					
							<div class="row">
									<div class="col-md-4">
									   
										<div class="form-group">
											<form:label path="password"><font size="4">Enter New Password</font></form:label>
											<form:input type="password" id="password" path="password" class="form-control" style="width:250px;" required="required" />
  <font id="passwordError" style="color: pink;">${passwordError}</font>
										</div>
									</div>
									
								</div>	
								
								<div class="row">
						<div class="col-md-4">
									<div class="form-group">
										<label ><font size="4">Confirm Password</font></label>
	<input name="confirmPassword" type="password" class="form-control" id="confirmPassword" style="width:250px;" path="confirmPassword" required="required"/>
	<font id="confirmPasswordError" style="color: pink;">${passwordError}</font>
									</div>
								</div>
						
					</div>
					<br>
									
						<button type="submit" class="btn btn-primary btn-lg" onclick="return validate()">Submit</button>
						
				
				
				</form:form>			
				
 <script type="text/javascript"
	src='<spring:url value="/res/static/scripts/val.js"/>'>
</script>				
				
		</div>
	</div>
</div>
</body>
</html>