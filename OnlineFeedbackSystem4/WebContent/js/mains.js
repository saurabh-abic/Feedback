 

function toggle_visibility() {
       var e = document.getElementById('feedback-main');
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }
  
   var form_being_submitted = false; // global variable

   function checkForm(form)
   {
	   var e = document.getElementById('button');
     if(form.email.value == "" && form.password.value == "") {
       return false;
     }
     else{
    	 
    	 e.disabled = true;
    	 e.value = "Please";
    	 return true;
     }
   }
   
  function checkbox1(){
	   var x = document.getElementById("exampleInputPassword1");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
   }
  function checkbox2(){
	   var x = document.getElementById("exampleInputPassword2");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
  }
  function checkbox3(){
	   var x = document.getElementById("exampleInputPassword3");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
  }
  function checkbox4(){
	   var x = document.getElementById("exampleInputPassword4");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
 }
  function checkbox5(){
	   var x = document.getElementById("inputPassword4");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
  }
  function checkbox6(){
	   var x = document.getElementById("inputPassword5");
	    if (x.type == "password") {
	        x.type = "text";
	    } 
	    else {
	        x.type = "password";
	    }
	    
  }
  
 
   
   
  
         
   function reset(){
	   document.getElementById('fid').value="";
	   }            
	           
	            

  
     
	    
	           
   

