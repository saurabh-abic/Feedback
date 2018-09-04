<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="DTO.*" %>
   <%@ page import="DAO.*" %>
    <%@ page import=" java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Feedback Form </title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="assets1/css/form.css" >
        <script src="form.js"></script>
    </head>
    <body >
    <%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>
<% 
FacultyDto st=null;
ArrayList<FacultyDto> myList = (ArrayList<FacultyDto>)request.getAttribute("list");
Iterator<FacultyDto> itr=myList.iterator();
while(itr.hasNext()){
	st=itr.next();
}
%>
<%-- <b>Faculty Name:- <%= st.getName()%></b>
<b> Subject:- <%= st.getSubject()%></b>
<b> Branch:- <%= st.getBranch() %></b>
<% }%> --%>
        <div class="container">
            <div class="imagebg"></div>
            <div class="row " style="margin-top: 50px">
                <div class="col-md-6 col-md-offset-3 form-container">
                    <h2>Feedback</h2> 
                    <p> Please provide your feedback below: </p>
                    <form action="FeedbackValue"  method="post" id="reused_form">
                    <input type="hidden" name="sid" value="${object.getRoll()}">
                    <input type="hidden" name="fid" value="<%= st.getId()%>">
                    <input type="hidden" name="subject" value="<%=st.getSubject() %>">
                        <div class="row">
                            <div class="col-sm-12 form-group" >
                                <label >Learning value (in terms of skills, 
    concepts, knowledge, analytical abilities, or  broadening perspectives)  </label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Applicability/relevance to real life situations	</label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience2" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience2" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience2" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience2" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience2" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Depth of the course content	</label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience3" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience3" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience3" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience3" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience3" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Extent of coverage of course</label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience4" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience4" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience4" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience4" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience4" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>Extent of effort required by students</label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience5" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience5" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience5" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience5" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience5" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>	Relevance/learning value of project/ report  </label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience6" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience6" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience6" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience6" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience6" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                            <div class="col-sm-12 form-group">
                                <label>How do you rate your overall experience?</label>
                                <p>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience7" id="radio_experience" value="1" >
                                        Bad 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience7" id="radio_experience" value="2" >
                                        Average 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience7" id="radio_experience" value="3" >
                                        Good 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="experience7" id="radio_experience" value="4" >
                                         Very Good 
                                    </label>
                                     <label class="radio-inline">
                                        <input type="radio" name="experience7" id="radio_experience" value="5" >
                                        Excellent
                                    </label>
                                </p>
                                
                            </div>
                        </div>
                      
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <button type="submit" class="btn btn-lg btn-warning btn-block" >Post </button>
                            </div>
                        </div>
                    </form>
                  
                </div>
            </div>
        </div>
    </body>
</html>