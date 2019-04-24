<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Way 2 Policy Admin/User Login Form</title>
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<!-- Spring Csss, Scripts and Images -->

<spring:url value="/res/static/styles/indexstyle.css" var="indexStyle" />
<link href="${indexStyle}" rel="stylesheet" />
<link href="<spring:url value='/res/static/styles/bootstrap.min.css' />" rel="stylesheet" />
<link href="<spring:url value='/res/static/styles/custom.css' />" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

</head>

<body>

	<div class="top-header section-bg">
		<div class="verticle-center">
			<div class="container">
				<div class="row">
					<div class="display-flex">
						<div class="col-lg-7 col-md-6">
							<h2 class="display-3">Way2Policy</h2>
							<p class="pg">Way2Policy is a online medium between users and vendors where they both can buy and sell their policies in a easy way.</p>
							<h2 class="display-3">Users</h2>
							<p class="pg">Users of our website can easily choose their policy between various different type make their payment online too.</p>
							<div class="button-group">
								<a href="userLogin" class="btn btn-new-bg btn-lg">User Sign In/Sign Up</a> 
							</div>
							<h2 class="display-3">Vendors</h2>
							<p class="pg">Vendors of our website can edit and their policies to sell in our website and they can also easily track them.</p>
							<div class="button-group">
								<a href="vendorLogin" class="btn btn-new-bg btn-lg">Vendor Sign In/Sign up</a> 
							</div>
						</div>
						<div class="col-lg-5 col-md-6">
							<img src="${images}\logo.png" alt="logo" class="img-circle" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script type="text/javascript"
		src='<spring:url value="/res/static/scripts/index.js"/>'></script>



	<!-- <script src="scripts/index.js"></script>
 -->




</body>

</html>
