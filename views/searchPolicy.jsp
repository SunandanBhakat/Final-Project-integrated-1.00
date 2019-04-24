l<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
 <!--  <link rel="stylesheet" href="styles/bootstrap.min.css" type="text/css"> -->
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  
  <!-- Spring Csss and Images -->

  <spring:url value="/res/static/styles/style1.css" var="style1Css" />
   <link href="${style1Css}" rel="stylesheet" />
  <spring:url value="/res/static/styles/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<spring:url value="/res/static/images" var="images" />

<!-- END Spring Csss and Images -->
  
  <!-- <link rel="stylesheet" href="styles/style1.css" type="text/css"> -->
  
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
       <div class="col-md-2">
				<div class="card mb-2" style=" background-color: #000000;
  opacity: .5;">
						<h3 class="card-header">Hey!</h3>
						<div class="card-body">
						   <h5 class="card-title">${sessionScope.userData.firstName}&nbsp;&nbsp;${sessionScope.userData.lastName}</h5>
						 
						  <h6 class="card-title" style="margin-left:50px">User</h6>
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
				
		</div>  <c:url var="crossAction" value="/user/search"></c:url>
 
    
    <div class="col col-md-offset-2 col-md-4" ></div>
    <div class="col col-md-offset-2 col-md-5" >
    <c:url var="searchAction1" value="/user/searchPolicyByCategory/"></c:url>
        <form:form  action="${searchAction1}" method="get" commandName="policy">
         <c:if test="${searchResult eq false }"> <!-- Failed due to Category unavailable -->
					<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert" onclick="window.location.href='${crossAction}'">&times;</button>
							<strong>Error!</strong> Policy Not Found. Please Try with a different Category.
							
						</div>
					</div>
				</c:if>
				
<c:if test="${searchResultId eq false }"> <!-- Failed due to Id unavailable -->
					<div class="form-group">
						<div class="alert alert-danger alert-dismissible">
							<button type="button" class="close" data-dismiss="alert" onclick="window.location.href='${crossAction}'">&times;</button>
							<strong>Error!</strong> Policy Not Found. Please Try with a different policy Id.
							
						</div>
					</div>
				</c:if>
          <div class="row">
  
            <div class="col-md-4">
              <div class="form-group">
                <!-- <label></label> -->
                
                <form:select  path="policyType" class="custom-select" required="required">
                <c:forEach items="${pCatagory}" var="pol">
                    <form:option value="${pol}" items="${pol}"/>
                </c:forEach>  
                  </form:select>
                  
                  
                
              </div>
            </div>
           
             <div class="col-md-4">
              <div class="form-group">
                
                
              </div>
            </div>
          </div> 
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                   
                    <form:select path="durationOfPolicy" class="custom-select">
                            <option  value="0">Choose No of Years</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                            <option value="4">Four</option>
                            <option value="5">Five</option>
                          </form:select>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
               
              </div>
            </div>
          </div>  
        
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
               
              </div>
            </div>
            
          </div> 
          
 
  
          
   <button type="submit" class="btn btn-primary btn-lg" name="search" value="search" style="margin-left:60px;">Search</button>

           <div> 
  
          
            <p style="margin-left:100px;"> Or</p>   
           </div>
          </form:form>
          
          <!-- Second Search Button -->
          <c:url var="searchAction2" value="/user/searchPolicyById/"></c:url>
          
          <form:form  action="${searchAction2} " method="get" commandName="policy">
            <div class="row">
                    <div class="col-md-4">
                            <div class="form-group">
                                    <form:label path="">Enter Policy Id</form:label>
                                    <form:input type="number" path="id" name="id" class="form-control" required="required"/>
                                  </div>
                    </div>
                    <div class="col-md-4">
                      <div class="form-group">
                       
                      </div>
                    </div>
            </div>
         
  
          
            <button type="submit" name="quicksearch" value="quick_search" class="btn btn-primary btn-lg" style="margin-left:50px; margin-top:30px;"  >Quick Search</button>   

        </form:form> 
    </div>
    
  </div>
</div>
</body>
</html>