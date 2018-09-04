<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DTO.*" %>
   <%@ page import="DAO.FacultyDao" %>
    <%@ page import=" java.util.ArrayList" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Admin Page</title>
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
if(session.getAttribute("name")==null) 
response.sendRedirect("index.html");

%>
<section id="main">

				<div class="inner">
					<jsp:include page="Header.jsp">
						<jsp:param value="Header" name="pageTitle"/>
						</jsp:include>
					<div class="wrapper style1">
						<div class="content">
						
						<div class="row 200%">
									<div class="6u 12u$(xsmall)">

									<center>	
									         <h4>Hiii   Admin</h4>
									         <br/>
											<hr />
											<h3>Search</h3>
											<br/>
											<form method="post" action="SearchFeedback">
												<div class="row uniform">
													<div class="4u 12u$(small)">
														<input type="radio" id="priority-low" name="search" value="name" checked/>
														<label for="priority-low">By Name</label>
													</div>
													<div class="4u 12u$(small)">
														<input type="radio" id="priority-normal" name="search" value="id">
														<label for="priority-normal">By Faculty Id</label>
													</div>
													<div class="4u$ 12u$(small)">
														<input type="radio" id="priority-high" name="search" value="branch">
														<label for="priority-high">By Branch</label>
													</div>
												
													<div class="12u$">
														<input type="text" name="name" id="name" value="" placeholder="Enter Selected Data" />
													</div>
													<div class="12u$">
														<ul class="actions">
															<li><input type="submit" class="button special" value="Search" /></li>
														</ul>
													</div>
													</div>
													</form>
													
												  </center>
											<hr />
                                        
                                    </div>	
								 
													
<% 
//if(request.getParameter("fid")!=null){
ArrayList<FacultyDto> myList = (ArrayList<FacultyDto>)request.getAttribute("list"); 
int count=0;
if(myList==null){}
else{
	%>
	
	 <div class="12u$">
                                        <!-- Table -->
											<h3>Searched Result</h3>
                                           <br/>
											
											<div class="table-wrapper" style="overflow-x:auto;">
												<table>
													<thead>
														<tr>
															  <th>S.No.</th>
                                                            <th>Faculty Id</th>
                                                                <th>Name</th> 
                                                                <th>Branch</th>     
														</tr>
													</thead>
													<tbody>
	
	<% 
	
	
                 Iterator<FacultyDto> itr=myList.iterator();
                 while(itr.hasNext()){ 
         			count++;
       			  FacultyDto st=itr.next(); 
       			  String fid1=st.getId();
       			  String name1=st.getName();
       			  String branch1=st.getBranch();
       			 
       		
        // System.out.println(st.getSubject());
	  %>
	
		<tr>
	 <td><%=count %> </td>
	  <td> <%=fid1 %></td>
	  <td><%=branch1 %></td>
	  <td><%=name1 %></td>
	  <td>
	  <form action="ShowFeedback" method="post" target="_blank">
	    <input type="hidden" value="<%=fid1%>" name="fid">
	     <input type="hidden" value="<%=name1%>" name="name">
	  <input type="submit" class="button special" value="View Feedback" style="background-color:#ff4c4c;">
	  </form>
	  </td>
   </tr>
  
<%
                 }            }
//}
%>
														
		 </tbody>											
												</table>
											</div>

									


						</div>
						</div>
						</div>
					</div>
				 </div>
				</section>
			</body>
		</html>
					