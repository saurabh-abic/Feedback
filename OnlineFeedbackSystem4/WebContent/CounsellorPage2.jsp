<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DTO.CounsellorAddDto" %>
   <%@ page import="DAO.FacultyDao" %>
    <%@ page import=" java.util.ArrayList" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>Counsellor Page</title>
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

if(session.getAttribute("cid")==null) 
response.sendRedirect("index.html");

String ccid=(String)session.getAttribute("cid");
String name=(String)session.getAttribute("name");
%>

<section id="main">
				<div class="inner">
				
					<div class="wrapper style1">
						<div class="content">

							<!-- Elements -->
							
								<div class="row 200%">
									<div class="6u 12u$(xsmall)">

									<center>	
									         <h4>Hiii   Mr. <%=name %></h4>
									         <h4>Counsellor Id : <%=ccid %></h4>
									         <br/>
									         <form action="Logout" method="post">
									         <input type="submit" class="button special" name="logout" value="Logout">
									         </form>
											<hr />
											<h3>Add Faculty</h3>
                                    

											<form method="post" action="CounsellorAdd">
												<div class="row uniform">
													<div class="6u 12u$(xsmall)">
														<input type="hidden" name="cid"  id="name" placeholder="Counsellor Id" value=${cid} />
													</div>
													<div class="12u$">
														<input type="text" name="fid" id="email" value="" placeholder="Faculty ID" required/>
													</div>
                                                   <div class=" 12u$">
														<input type="text" name="subject" id="email" value="" placeholder="Subject" required/>
													</div>
													<!-- Break -->
													<div class="12u$">
														<div class="select-wrapper">
															<select name="branch" id="branch">
																
																  <option selected>Computer Science</option>
                                                                    <option>Civil Engineering</option>
                                                                    <option>Electronics</option>
                                                                    <option>Electrical</option>
                                                                    <option>Information Technology</option>
                                                                    <option>Mechanical</option>
															</select>
														</div>
													</div>
                                                    
                                                    <div class="12u$">
														<div class="select-wrapper">
															<select name="year" id="year">
																
																   <option>First</option>
                                                                    <option>Second</option>
                                                                    <option>Third</option>
                                                                    <option>Fourth</option>
															</select>
														</div>
													</div>
                                                    
                                                                                                        
                                                     <div class="12u$">
														<div class="select-wrapper">
															<select name="sec" id="section">
																<option value="">- Sections -</option>
																    <option>A</option>
                                                                    <option>B</option>
                                                                    <option>C</option>
                                                                    <option>D</option>
															</select>
														</div>
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
											<h3>Added Faculties</h3>
                                           <br/>
											
											<div class="table-wrapper" style="overflow-x:auto;">
												<table>
													<thead>
														<tr>
															  <th>S.No.</th>
                                                            <th>Faculty Id</th>
                                                                <th>Subject</th> 
                                                                <th>Branch</th>
                                                                <th>Year</th>
                                                                <th>Section</th>
                                                                
														</tr>
													</thead>
													<tbody>
													
<% 
//if(request.getParameter("fid")!=null){
ArrayList<CounsellorAddDto> myList = (ArrayList<CounsellorAddDto>)request.getAttribute("list"); 
int count=0;
if(myList==null){}
else{
                 Iterator<CounsellorAddDto> itr=myList.iterator();
                 while(itr.hasNext()){ 
         			count++;
       			  CounsellorAddDto st=itr.next(); 
       			  String fid1=st.getId();
       			  String subject1=st.getSubject();
       			  String branch1=st.getBranch();
       			  String year1=st.getYear();
       			  String sec1=st.getSec();
       		
        // System.out.println(st.getSubject());
	  %>
	
		<tr>
	 <td><%=count %> </td>
	  <td> <%=fid1 %></td>
	  <td><%=subject1 %></td>
	  <td><%=branch1 %></td>
	  <td><%=year1 %></td>
	  <td><%=sec1 %></td>
	  <td>
	  <form action="CounsellorDel" method="post">
	   <input type="hidden" value="<%=fid1%>" name="fid">
	   <input type="hidden" value="<%=subject1%>" name="subject">
	   <input type="hidden" value="<%=ccid%>" name="cid">
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