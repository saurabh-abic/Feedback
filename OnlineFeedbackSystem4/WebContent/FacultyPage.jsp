<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		 <link rel="stylesheet" href="assets1/css/main.css" />
		 <link href="css/bootstrap.min.css" rel="stylesheet">
		 <link href="css/main.css" rel="stylesheet">
     <script type="text/javascript" src="js/mains.js"></script>
    
<title>Faculty Page</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>
		<section id="main">
				<div class="inner">
				
				<nav class="navbar navbar-expand-lg navbar-light bg-success">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Modify Details
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         
           <a class="dropdown-item" href="FacultyFeedback.jsp">Modify Details</a>
        
        </div>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" action="Logout" method="get">
        <input class="form-control mr-sm-2" type="submit"  value="logout" name="logout">
    </form>
  </div>
</nav>
   
				
				<!-- One -->
					<section id="one" class="wrapper style1">

						<div class="image fit flush">
							<img src="Assets/student1.jpg" alt="" />
						</div>
						<header class="special">
							<h2>Hello Professor ${object.getName()}</h2>
							<h2>Faculty Id : ${object.getId()}</h2>
							<p>Department : ${object.getBranch()}</p>
						</header>
						<div class="content">
							<p>Feedback is an essential part of effective learning. It helps students understand the subject being  Edited textstudied and gives them clear guidance on how to improve their learning.  </p>
							<p>We are committed to providing students with an outstanding learning and teaching experience, programmes of study that are challenging and of international calibre, and opportunities and support to achieve your academic and personal potential.To ensure we continue to meet these commitments, we need to know how well we are doing and what you had like to see done better.Student feedback is an important part of this process. 
							Your feedback also provides us with ideas and incentives to make further improvements in what we do for you.</p>
						</div>
					</section>
                    <center>
                                <form action="ShowFeedback" target="_blank" method="post">
                    
                                  <ul class="actions">
											<input type="hidden" name="fid" value= "${object.getId()}" />
											<input type="hidden" name="name" value= "${object.getName()}" />
                                             <input type="submit" class="button special" value="View Feedback"/>
                                   </ul>
                                    
                    </form>
                    </center>
                    <br/> <br/>
                 	</div>
			</section>

		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
					</ul>
				</div>
				
			</footer>

		<!-- Scripts -->
	<script src="js/jquery-3.3.1.min.js"></script>
     <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
</body>
</html>