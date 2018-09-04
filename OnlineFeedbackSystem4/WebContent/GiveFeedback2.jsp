<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="DTO.*"%>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE HTML>

<html>
	<head>
		<title>Feedback Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
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
					<div class="wrapper style1">
						<div class="content">

							<!-- Elements -->
							
								<div class="row 200%">
									<div class="6u 12u$(xsmall)">

									
                                        
                                    </div>
                                    
                                    <div class="12u">
                                        <!-- Table -->
											

	
	<div class="table-wrapper" style="overflow-x:auto;">
	<table>
 <% 
ArrayList<FacultyDto> myList = (ArrayList<FacultyDto>)request.getAttribute("list");
Iterator<FacultyDto> itr=myList.iterator();
while(itr.hasNext()){
	 FacultyDto st=itr.next();
	 String name=st.getName();
%>
													
													<tbody>
													 <tr>
<td> 
<h5>Name : <%= name %></h5>
<h5>Subject :<%= st.getSubject() %></h5>
<h5>Branch : <%= st.getBranch()%></h5>
</td>
<td colspan="4">
<form action="Feedback" method="post" target="_blank">
<input type="hidden" name="fid" value="<%=st.getId() %>">
<input type="hidden" name="sid" value="${object.getRoll()}">
<input type="hidden" name="uname" value="<%=st.getName() %>">
<input type="hidden" name="subject" value="<%=st.getSubject() %>">
<input type="hidden" name="branch" value="<%=st.getBranch() %>">
<input type="submit" class="button special" value="Give Feedback" name="givefeedback" style="vertical-align: middle;">
</form>
</td>
<%} %>
</tr>	
</tbody>
													
	</table>
	</div>

									


                                    </div>
						</div>
					</div>
                    </div>
                </div>
            
			</section>

		
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			 <script src="js/jquery-3.3.1.min.js"></script>
     <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>

	</body>
</html>