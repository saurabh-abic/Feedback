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
<body>'
 
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("name")==null) 
response.sendRedirect("index.html");

%>
<section id="main">
				<div class="inner">
					<%-- <jsp:include page="Header.jsp">
						<jsp:param value="Header" name="pageTitle"/>
						<jsp:include> --%>
					<div class="wrapper style1">
						<div class="content">

							<!-- Elements -->
							
								<div class="row 200%">
									<div class="6u 12u$(xsmall)">

									<center>	
									         <h4>Hiii   Admin</h4>
									         <br/>
											<hr />
											<h3>Add Counsellor</h3>
                                    

											<form method="post" action="AddCounsellorData">
												<div class="row uniform">
													
													<div class="12u$">
														<input type="text" name="fid" id="email" value="" placeholder="Faculty ID" required/>
													</div>
                                                   <div class=" 12u$">
														<input type="text" name="name" id="email" value="" placeholder="Name" required/>
													</div>
													<div class="6u 12u$(xsmall)">
														<input type="text" name="cid"  id="name" placeholder="Counsellor Id"  required/>
													</div>
													<div class="6u 12u$(xsmall)">
													    <input type="text" name="pass"  id="name" placeholder="Password"  required/>
													</div>
													
													<div class="12u$">
														<ul class="actions">
															<li><input type="submit" class="button special" value="ADD" /></li>
															<li><input type="reset" value="Reset" class="alt" /></li>
														</ul>
													</div>
												</div>
											</form>
                                        </center>
											<hr />
                                        
                                    </div>
                                    
                                    <div class="12u$">
                                        <!-- Table -->
											<h3>Added Counsellors</h3>
                                           <br/>
										
											<div class="table-wrapper"  style="overflow-x:auto;">
												<table>
													<thead>
														<tr>
															  <th>S.No.</th>
                                                                <th>Faculty Id</th>
                                                                <th>Name</th> 
                                                                <th>Counsellor Id</th>
                                                                <th>Password</th>

                                                                
														</tr>
													</thead>
														<tbody>
													
<% 
//if(request.getParameter("fid")!=null){
ArrayList<AddCounsellorDataDto> myList = (ArrayList<AddCounsellorDataDto>)request.getAttribute("list"); 
int count=0;
if(myList==null){}
else{
                 Iterator<AddCounsellorDataDto> itr=myList.iterator();
                 while(itr.hasNext()){ 
         			count++;
         			AddCounsellorDataDto st=itr.next(); 
       			  String fid1=st.getFid();
       			  String name1=st.getName();
       			  String cid1=st.getCid();
       			  String pass1=st.getPass();
       			 
       		
        // System.out.println(st.getSubject());
	  %>

		<tr>
	 <td><%=count %> </td>
	  <td> <%=fid1 %></td>
	  <td><%=name1%></td>
	  <td><%=cid1 %></td>
	  <td><%=pass1 %></td>
	  <td>
	  <form action="DelCounsellor" method="post">
	   <input type="hidden" value="<%=fid1%>" name="fid">
	  <input type="submit" class="button special" value="DEL" style="background-color:#ff4c4c;">
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