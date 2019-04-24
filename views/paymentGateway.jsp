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
<title>Way 2 Policy</title>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<!-- Spring Csss, Scripts and Images -->

<spring:url value="/res/static/styles/style1.css" var="style" />
<link href="${style}" rel="stylesheet" />
<spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<script src="<c:url value="/res/static/scripts/validate.js" />"></script>
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss, Scripts and Images -->


</head>
<body id="body1">
<div class="top-header section-bg">
	<c:url var="homeAction" value="/userPanel"></c:url>
	<c:url var="logoutAction" value="/logout"></c:url>
	<%-- <c:url value="${'/user/myPolicy'}" var="myPolicyUrl" /> --%>
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand"> <img src="${images}/logo.png" width="50"
				height="50" alt="">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/user/search">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item active"><a class="nav-link"
						href="${homeAction}">${adminname} <span class="sr-only">(current)</span></a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<form action="#">
							<button class="btn btn-lg btn-success"
							onclick="window.location.href='${logoutAction}'">Logout</button>
						</form>
					</li>

				</ul>
			</div>
		</nav>



		<!-- Condition Checker -->
		<c:url var="successAction" value="/user/myPolicy"></c:url>
		<c:url var="failureAction" value="/user/search"></c:url>
		<c:if test="${flag eq true }">
			<div class="form-group">
				<!-- Success Message -->
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert"
						onclick="window.location.href='${successAction}'">&times;</button>
					<strong>Congratulations!!</strong> Transaction was Successful.

				</div>
			</div>
		</c:if>

		<c:if test="${flag eq false }">
			<!-- Failed due to Id unavailable -->
			<div class="form-group">
				<div class="alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert"
						onclick="window.location.href='${failureAction}'">&times;</button>
					<strong>Error!</strong> Transaction failed.. Please Try again After
					Sometime!

				</div>
			</div>
		</c:if>

		<c:url var="cancelTransaction" value="/user/cancelTransaction"></c:url>
		<c:url var="createTransactionCredit"
			value="/user/buyPolicy/creditCard"></c:url>
		<c:url var="createTransactionDebit" value="/user/buyPolicy/debitCard"></c:url>
		<c:url var="createTransactionUpi" value="/user/buyPolicy/upi"></c:url>
		<!-- Condition Checker ends here -->
		<div class="row">
			<p></p>
		</div>
		<div class="row"></div>
		<div class="col col-md-offset-2 col-md-2"></div>
		<div class="col col-md-offset-2 col-md-7" style="margin-left: 200px;"></div>

		<!-- Credit Card -->



		<form method="post" action="${createTransactionCredit}"  id="form" 
			style="margin-left: 600px;">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<h2 style="color: rgb(211, 25, 87)">
							<b>Credit Card</b>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<label style="background-color:black;"><font size="4">Full Name(On Card)</font></label> <input
							type="text" id="firstName" class="form-control" required /> <font
							id="firstNameError" style="color: red;"></font>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div class="form-group">
						<label style="background-color:black;"><font size="4">Card Number</font></label> <input
							type="text" id="card" class="form-control" required
							placeholder="0000-0000-0000-0000" /> <font id="cardError"
							style="color: red;"></font>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
					<label style="background-color:black;"><span class="hidden-xs">Expiration</span> </label>
					<div class="input-group">
						<input type="number" class="form-control" placeholder="MM" name=""
							min="1" max="12" id="expire" /> <input type="number"
							class="form-control" placeholder="YY" name="" min="2019"
							id="expire" />
					</div>
					<font id="expireError" style="color: red;"></font>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label style="background-color:black;"><font size="4">CVV</font></label> <input type="text"
							class="form-control" required placeholder="XXX" id="cvv" /> <font
							id="cvvError" style="color: red;"></font>
					</div>
				</div>
			</div>
			<br>
			<button type="submit" class="btn btn-primary btn-lg"
				onclick="return validate()">Submit</button>
			<button type="button" class="btn btn-primary btn-lg"<%-- onclick="window.location.href='${cancelTransaction}'" --%> >Cancel
				Transaction</button>
		</form>
	</div>
	</div>
	<br>
	<br>
	<br>
	<div class="row">
		<p></p>
	</div>


	<!-- Debit Card -->
	<div class="row"></div>
	<div class="col col-md-offset-2 col-md-2"></div>
	<div class="col col-md-offset-2 col-md-7" style="margin-left: 200px;"></div>
	<form method="post" action="${createTransactionDebit}" <%-- id="form1" --%>
		style="margin-left: 600px;">
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<h2 style="color: rgb(211, 25, 87)">
						<b>Debit Card</b>
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label style="background-color:black;"><font size="4">Full Name(On Card)</font></label> <input
						type="text" class="form-control" required id="firstName1" /> <font
						id="firstNameError1" style="color: red;"></font>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label><font size="4" style="background-color:black;">Card Number</font></label> <input type="text"
						class="form-control" required placeholder="0000-0000-0000-0000"
						id="card1" /> <font id="cardError1" style="color: red;"></font>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<label style="background-color:black;"><span class="hidden-xs">Expiration</span> </label>
				<div class="input-group">
					<input type="number" class="form-control" placeholder="MM" name=""
						min="1" max="12" id="expire1" /> <input type="number"
						class="form-control" placeholder="YY" name="" min="2019"
						id="expire1" />
				</div>
				<font id="expireError1" style="color: red;"></font>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<label style="background-color:black;"><font size="4">CVV</font></label> <input type="text"
						class="form-control" required placeholder="XXX" id="cvv1" /> <font
						id="cvvError1" style="color: red;"></font>
				</div>
			</div>
		</div>
		<br>
		<button type="submit" class="btn btn-primary btn-lg"
			onclick="return valid()">Submit</button>
		<button type="button" class="btn btn-primary btn-lg"
			onclick="window.location.href='${cancelTransaction}'">Cancel
			Transaction</button>
	</form>
	</div>
	<div class="row">
		<p></p>
	</div>
	<br>
	<br>
	<br>
	<div class="row"></div>
	<div class="col col-md-offset-2 col-md-2"></div>
	<div class="col col-md-offset-2 col-md-7" style="margin-left: 200px;"></div>

	<!-- UPI -->
	<form method="post" action="${createTransactionUpi}"
		style="margin-left: 600px;">
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<h2 style="color: rgb(211, 25, 87)">
						<b>UPI</b>
					</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="form-group">
					<label style="background: rgba(0, 0, 0, 0.9)"><font size="4">UPI Id</font></label> <input type="text"
						class="form-control" required />
				</div>
			</div>
		</div>
		<br>
		<button type="submit" class="btn btn-primary btn-lg"<%-- onclick="window.location.href='${createTransactionUpi}'" --%>>Submit</button>
		<button type="button" class="btn btn-primary btn-lg"
			onclick="window.location.href='${cancelTransaction}'">Cancel
			Transaction</button>
	</form>
	</div>
	</div>
</body>
</html>