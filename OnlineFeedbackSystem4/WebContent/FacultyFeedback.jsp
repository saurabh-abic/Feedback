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
<%@ page errorPage="error.jsp" %>  
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
        <a class="nav-link" href="FacultyPage.jsp">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Modify Details
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         
           <a class="dropdown-item" href="FacultyPage.jsp">Modify Details</a>
        
        </div>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" action="Logout" method="get">
        <input class="form-control mr-sm-2" type="submit"  value="logout" name="logout">
    </form>
  </div>
</nav>
					<div class="wrapper style1">
						<div class="content">

							<!-- Elements -->
							
							
									<div class="6u 12u$(xsmall)">

									
									         <%-- <h4>Hiii   <%=name %></h4>
									         <h4>Counsellor Id : <%=ccid %></h4> --%>
									         <br/>
									      
											<hr />
											<h3>Update Details</h3>
                                    
                                             <br/>
											<form method="post" action="UpdateFaculty">
												<div class="row uniform">
													
													<div class="12u$">
													<label>Faculty Id :</label>	<input type="text" name="fid" id="email" value="${object.getId()}" placeholder="Faculty ID"  disabled>
													</div>
													<div class="12u$">
													<label>Name :</label>	<input type="text" name="name" id="name" value="${object.getName()}" placeholder="Name"  disabled/>
													</div>
													<div class="12u$">
													<label>Mobile NO:</label>	<input type="text" name="mob" id="name" value="${object.getMob()}" placeholder="Mobile no."  />
													</div>
                                                  
													<div class="12u$">
													<label>Email Id :</label>	<input type="text" name="email" id="email" value="${object.getEmail()}" placeholder="Email Id" />
													</div>
													<div class="12u$">
													<label>Password :</label>	<input type="text" name="pass" id="name" value="${object.getPassword()}" placeholder="Password"  />
													</div>
													<!-- Break -->
													<div class="12u$">
													<label>Branch :</label>	<input type="text" name="branch" id="name" value="${object.getBranch()}" placeholder="Branch" disabled />
													</div>
                                                 
													
													<div class="12u$">
														<ul class="actions">
															<li><input type="submit" class="button special" value="Update" /></li>
															
														</ul>
													</div>
												</div>
											</form>
                                        
											<hr />
                                        
                                    </div>
											

									


                                    </div>
						</div>
					</div>
                    </div>
                </div>
                </section>
                
                  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.3.1.min.js"></script>
     <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>