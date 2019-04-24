function validate(){
    var f=document.getElementById("form");
    
    
    var hasPasswordError = validatePassword(f);
    
    if(!hasPasswordError)
    	return false;
    else
    	return true;
}
function  validatePassword(form){
    var error1=document.getElementById("passwordError");
    var error2=document.getElementById("confirmPasswordError");
    error1.innerHTML="";
    
    var password=form["password"].value;
    
   
    error2.innerHTML="";
    
    var confirmPassword=form["confirmPassword"].value;
    
    if( password==null || password==""){
    error1.innerHTML="Give Password";
    }
    
    
    
    else if( confirmPassword==null || confirmPassword==""){
    error2.innerHTML="Give Confirm Password";
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