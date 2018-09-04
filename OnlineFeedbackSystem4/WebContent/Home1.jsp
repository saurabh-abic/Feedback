<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE HTML>
<!--
	Caminar by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Student Feedback Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets1/css/main.css" />
			<!-- Main CSS -->
     <link href="css/main.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <script type="text/javascript" src="js/mains.js"></script>
	</head>
	<body>
	<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>

		<!-- Header -->
			<header id="header">
				<div class="logo"><a href="#">Student<span>Feeddback Page</span></a></div>
			</header>

		<!-- Main -->
			<section id="main">
				<div class="inner">
                <nav class="navbar navbar-expand-lg navbar-light bg-success">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0" action="Logout" method="get">
      <input class="form-control mr-sm-2" type="submit" style="align:right" value="logout" name="logout">
   
    </form>
  </div>
</nav>
				<!-- One -->
					<section id="one" class="wrapper style1">

						<div class="image fit flush">
							<img src="Assets/student1.jpg" alt="" />
						</div>
						<header class="special">
							<h2>Hey ${object.getName()}</h2>
							<h2>${object.getRoll()}</h2>
							<p>${object.getBranch()}</p>
						</header>
						<div class="content">
							<p>Feedback is an essential part of effective learning. It helps students understand the subject being  Edited textstudied and gives them clear guidance on how to improve their learning.  </p>
							<p>We are committed to providing students with an outstanding learning and teaching experience, programmes of study that are challenging and of international calibre, and opportunities and support to achieve your academic and personal potential.To ensure we continue to meet these commitments, we need to know how well we are doing and what you had like to see done better.Student feedback is an important part of this process. 
							Your feedback also provides us with ideas and incentives to make further improvements in what we do for you.</p>
						</div>
					</section>
                    <center>
                                <form action="FeedbackPage" method="post">
                    
                                  <ul class="actions">
											
                                                 <input type="submit" class="button special" value="Start Feedback"/>
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
				<!-- <div class="copyright">
					&copy; Untitled. All rights reserved. Images <a href="https://unsplash.com">Unsplash</a> Design <a href="https://templated.co">TEMPLATED</a>
				</div> -->
			</footer>

		<!-- Scripts -->
			<!-- <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> -->
			 <script src="js/jquery-3.3.1.min.js"></script>
             <script src="js/JQuery.js"></script>
             <script src="js/bootstrap.min.js"></script>

	</body>
</html>