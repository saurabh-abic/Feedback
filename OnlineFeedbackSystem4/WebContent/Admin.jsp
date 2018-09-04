<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		 <link href="css/bootstrap.min.css" rel="stylesheet">
		   <link href="css/main.css" rel="stylesheet">
     <script type="text/javascript" src="js/mains.js"></script>    
    <title>Admin View</title>
</head>
<body background="Assets/admin-panel.jpg" >

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("name")==null) 
response.sendRedirect("index.html");

%>
	  
          
 
     
 <!-- Image and text -->
<nav class="navbar navbar-light bg-success align-items-center">
  <a class="navbar-brand" href="#">
   
    <strong>ADMIN PANEL</strong>
  </a>
</nav>

<!-- Modal -->

  <div class="modal-dialog" role="document" >
    <div class="modal-content">
     
      <div class="modal-header ">
        <h5 class="modal-title" id="exampleModalLabel">Administrator Control</h5>
        
          
        
      </div>
      <div class="modal-body bg-dark">
    
         <div class="row">
  <div class="col-sm-6">
    <div class="card">
     <div class="card-header bg-primary">
   <strong> <h5>Add Councellor</h5></strong>
  </div>
      <div class="card-body">
        
        <p class="card-text ">Hey Admin, Want to ADD the Councellors  click here..!!</p>
        <a href="AddCounsellorData" target="_blank" class="btn btn-primary">Add Councellor</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
     <div class="card-header bg-primary">
    <strong><h5>View Councellors</h5></strong>
  </div>
      <div class="card-body">
        
        <p class="card-text">Hey Admin, want to see the list  councelors click here..!!</p>
        <a  href="ViewCounsellor" target="_blank" class="btn btn-primary">View Councellors</a>
      </div>
    </div>
  </div>
</div>
     
     &nbsp;
     
     <div class="card text-center">
  <h5 class="card-header bg-primary">View-Feedback</h5>
  <div class="card-body">
    
    <p class="card-text">Hey Admin, click to view feed back of respective faculties..!!</p>
    <a href="FeedbackByName.jsp" target="_blank" class="btn btn-primary">View Feedback</a>
  </div>
</div>
     <form class="form-inline my-2 my-lg-0" action="Logout" method="post">
     
       <button type="submit" class="btn btn-danger btn-lg btn-block" value="Logout" name="logout">LOGOUT</button> 
    </form>
         
      </div>
      
    </div>
  </div>

      
         

           
            
             
       <!-- Optional JavaScript -->
     
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.3.1.min.js"></script>
     <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>