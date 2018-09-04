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
				<%-- <jsp:include page="Header.jsp">
						<jsp:param value="Header" name="pageTitle"/>
						</jsp:include> --%>
					<div class="wrapper style1">
						<div class="content">

							<!-- Elements -->
							
								<div class="row 200%">
									<div class="6u 12u$(xsmall)">

									<center>	
									         <h4>Hiii   Admin</h4>
									         <br/>
											<hr />
											<h3>View All Counsellors</h3>
                                        </center>
											<hr />
                                        
                                    </div>
                                    
                                    <div class="12u$">
                                        <!-- Table -->
											<h3></h3>
                                           <br/>
										
											<div class="table-wrapper" style="overflow-x:auto;">
												<table>
													<thead>
														<tr>
															    <th>S.No.</th>
                                                                <th>Faculty Id</th>
                                                                <th>Name</th> 
                                                                <th>Mobile</th>
                                                                <th>Email</th>
                                                                <th>Department</th>
                                                                 <th>Shift</th>

                                                                
														</tr>
													</thead>
														<tbody>
													
<% 
//if(request.getParameter("fid")!=null){
ArrayList<FacultyDto> myList = (ArrayList<FacultyDto>)request.getAttribute("list"); 
int count=0;
if(myList==null){}
else{
                 Iterator<FacultyDto> itr=myList.iterator();
                 while(itr.hasNext()){ 
         			count++;
         			FacultyDto st=itr.next(); 
       			  String fid=st.getId();
       			  String name=st.getName();
       			  String mob=st.getMob();
       			  String email=st.getEmail();
       			  String dept=st.getBranch();
       			  String shift=st.getShift();
       		
        // System.out.println(st.getSubject());
	  %>

		<tr>
	 <td><%=count %> </td>
	  <td> <%=fid %></td>
	  <td><%=name%></td>
	  <td><%=mob %></td>
	  <td><%=email %></td>
	  <td><%=dept %></td>
	  <td><%=shift %></td>
	  <td>
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