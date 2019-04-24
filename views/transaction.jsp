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
	
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
	
	
	<!-- Spring Csss and Images -->

  <spring:url value="/res/static/styles/style1.css" var="style1Css" />
   <link href="${style1Css}" rel="stylesheet" />
  <spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss and Images -->
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	<c:url value="${'/user/myPolicy'}"  var="myPolicyUrl"/>
function DelayRedirect() {
    var seconds = 5;
    var dvCountDown = document.getElementById("dvCountDown");
    var lblCount = document.getElementById("lblCount");
    dvCountDown.style.display = "block";
    lblCount.innerHTML = seconds;
    setInterval(function () {
        seconds--;
        lblCount.innerHTML = seconds;
        if (seconds == 0) {
            dvCountDown.style.display = "none";
            window.location = "${myPolicyUrl}";
        }
    }, 1000);
}
</script>
	
</head>
<body onload="DelayRedirect()" id="body">
        <div class="container-fluid">
                <div class="row"></div>
                <div class="row">
                 <div id="dvCountDown" style = "display:none">
                        <form>
                                <label style="padding-top:100px; margin-left: 900px;"> <font face = "cursive,serif" color = "#ff9900" size = "4"><strong>REDIRECTING IN....</strong><!-- You will be redirected after  --><span id = "lblCount"></span>&nbsp;seconds.</font></label>
                               


                            </form>
                    </div>
            		</div>
                    <div class="row">
                            <div class="container" style="padding-top:20px; margin-left: 300px;">
                                    <div class="row">
                                        <div class="col-md-3"> </div>
                                        <div class="col-md-3"> 
    <img src="${images}/transaction.gif" style="border-radius: 8.5rem"></div>
    </div></div>
    
   </div>
    </body>
    </html>
