function validate(){
    var f=document.getElementById("form");
     var hasPasswordError = validatePassword(f);
    var hasFirstNameError = firstNameValidate(f);
    var hasLastNameError = lastNameValidate(f)
    var hasContactError = contactValidate(f);
    var hasEmailError = validateEmail(f);
    var hasTanError = validateTan(f);
    if(!hasPasswordError || !hasFirstNameError || !hasLastNameError|| !hasEmailError || !hasContactError || !hasTanError)
return false;
else
return true;
}
function  validatePassword(form){
    var error1=document.getElementById("passwordError");
    var error2=document.getElementById("confirmPasswordError");
    error1.innerHTML="Give Password";
    
    var password=form["password"].value;
    
    error1.innerHTML="";
    error2.innerHTML="";
    
    var confirmPassword=form["confirmPassword"].value;
    
    if( password==null || password==""){
    error1.innerHTML="Give Password";
    }
    
    
    
    else if( confirmPassword==null || confirmPassword==""){
    error2.innerHTML="Confirm Password";
    }
    
    
    
    else if(password.length<6 || password.length>8){
    error1.innerHTML="Password has to be 6 to 8 chars"
    }
    
    else if(password != confirmPassword){
    error2.innerHTML="Password Does Not Match"
    }
    if(error1.innerHTML.length > 0 || error2.innerHTML.length > 0)
    return false;
    else
    return true;
     }
function firstNameValidate(form){
    var error=document.getElementById("firstNameError");
   
       var firstName=form["firstName"].value;
   
       error.innerHTML="";
   
       if( firstName==null || firstName==""){
           error.innerHTML="Input Your FirstName";
       }
   
       else if(!isNaN(id)){
           error.innerHTML="Name Can Not be a number";
       }
   
       else if(firstName.length<1 || firstName.length>10){
           error1.innerHTML="Name has to be 1 to 10 chars"
       }
   
   
       }

function validateEmail(form){
   var error=document.getElementById("companyEmailError");

   var email=form["companyEmail"].value;
   error.innerHTML="";
    var regx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

 if( email==null || email==""){
    error.innerHTML="Input Your Email";
  }

else if(!email.match(regx)){
  error.innerHTML="Invalid Email";
}

}

       function lastNameValidate(form){
        var error=document.getElementById("lastNameError");
       
           var lastName=form["lastName"].value;
       
           error.innerHTML="";
       
           if( lastName==null || lastName==""){
               error.innerHTML="Input Your LastName";
           }
       
           else if(!isNaN(id)){
               error.innerHTML="Name Can Not be a number";
           }
       
           else if(lastName.length<5 || lastName.length>10){
               error1.innerHTML="Name has to be 5 to 10 chars"
           }       
       
       }
       function contactValidate(from){
           var error=document.getElementById("contactError");
       
           var contact=form["contact"].value;
       
           error.innerHTML="";
       
           if( contact==null || contact==""){
               error.innerHTML="Input Your Contact";
           }
       
           else if(isNaN(id)){
               error.innerHTML="Name Can Not be alphabate";
           }
       
           else if(contact.length<5 || contact.length>10){
               error.innerHTML="Contact has to be 5 to 10 chars"
           }       
       
       }
       function validateTan(form)
       {
    	   var error=document.getElementById("tanIdError");
    	   var tan=form["tanId"].value;
    	   error.innerHTML="";
    	   if( tan==null || tan==""){
               error.innerHTML="Input Your Tan Id";
           }
    	   else if(tan.length!=10){
               error.innerHTML="Tan Id has to be 10 chars"
    	   }	
    	   
    	   var letterNumber = /^[0-9a-zA-Z]+$/;
    	   if(!tan.match(letterNumber))
    			   
    		   error.innerHTML="Tan Id has to be alphanumeric"
    			   
            	   
            	 /*  for(var i=0; i<tan.length; i++)
            	      {
            	        var cc = tan.charAt(i);
            	        

            	        if((cc>47 && cc<58) || (cc>64 && cc<91) || (cc>96 && cc<123))
            	        {
            	        	error.innerHTML="Tan Id has to be alphanumeric";
            	        }  	   
            	      }*/
           }  
    	   