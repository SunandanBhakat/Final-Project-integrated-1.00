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
	<title>Verify Hint Answer</title>
	
	
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
				
				
				<c:url var="verifyHint" value="/user/verifyHintQuestion/"></c:url>
				<form:form method="post" modelAttribute="forgotPassword" action="${verifyHint}">
				
				<c:if test="${hintAnswer eq false }">
				<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Error!</strong> Hint Answer Wrong. Please Try Again. 
							
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
										<h2>Hint Question Details</h2>
									</div>
								</div>
								
							</div>	
					
							<div class="row">
									<div class="col-md-4">
									    <%-- <form:hidden path = "emailId" value="${userHint.emailId}"/> --%>
										<div class="form-group">
											<form:label path="hintQuestion"><font size="4">Hint Question</font></form:label>
											<form:input path="hintQuestion" type="text" class="form-control" value="${userHint.hintQuestion}" readonly="true" style="background-color: #BDBDBD;"  />
										</div>
									</div>
									
								</div>	
								
								<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<form:label path="hintAnswer"><font size="4">Hint Answer</font></form:label>
								<form:input path="hintAnswer" type="text" class="form-control" required="required" autocomplete="off"/>
							</div>
						</div>
						
					</div>
					<br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
						<button type="submit" class="btn btn-primary btn-lg">Submit</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				
				</form:form>			
				
				
		</div>
	</div>
</div>
</body>
</html>