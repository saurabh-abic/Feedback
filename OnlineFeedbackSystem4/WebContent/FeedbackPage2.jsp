<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="DTO.*" %>
   <%@ page import="DAO.*" %>
    <%@ page import=" java.util.*" %>
    <%@ page errorPage="error.jsp" %> 
    <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <!-- Main CSS -->
     <link href="css/main.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
     
    
    <title>Questions</title>
  </head>
  <body>
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
    
 <!-------------------------------------------NAVBAR START------------------------------------------------>   
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
  <a class="navbar-brand" href="#">Your Feedback Matters</a>
 
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      
      
    </div>
  </div>
</nav>
 <!-------------------------------------------NAVBAR END------------------------------------------------>
   
  <div class="card text-center">
  <div class="card-header bg-dark text-white">
    Why Feedback?
  </div>
  <div class="card-body bg-secondary">
    <h5 class="card-title text-white">Feedback is Essential..</h5>
    <p class="card-text text-white">  Feedback is an essential part of education and training programmes. It helps learners to maximise their potential at different stages of training, raise their awareness of strengths and areas for improvement, and identify actions to be taken to improve performance.</p>
    
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
  Start Feedback
</button>
  </div>
  <div class="card-footer text-muted bg-dark text-white">
   We were always allowed to give feedback, bad or good, when our team attempted a new endeavor because it helped to improve things.
  </div>
</div>
   
   
   
   
  

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Answer Honestly</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <!---------------------------------------------------QUESTIONS START------------------------------------------------>   
   <div class="container-fluid">
     <form action="FeedbackValue"  method="post" id="reused_form">
                    <input type="hidden" name="sid" value="${object.getRoll()}">
                    <input type="hidden" name="fid" value="<%= st.getId()%>">
                    <input type="hidden" name="subject" value="<%=st.getSubject() %>">
     <div class="alert alert-dark" role="alert">
    1. Learning value (in terms of skills, concepts)
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options" id="option2"  value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options" id="option2"value="2"  autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options" id="option2"value="3"  autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options" id="option2"value="5"  autocomplete="off">5
  </label>
</div>
<br><br>


  <div class="alert alert-dark" role="alert">
   2. Applicability/relevance to real life situations
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options2" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options2" id="option2"value="1"  autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options2" id="option2" value="2"   autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options2" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options2" id="option2"value="4"  autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options2" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>


<div class="alert alert-dark" role="alert">
   3. Depth of the course content
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options3" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options3" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options3" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options3" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options3" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options3" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>


<div class="alert alert-dark" role="alert">
   4. Extent of coverage of course
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options4" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options4" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options4" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options4" id="option2" value="3"autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options4" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options4" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>


<div class="alert alert-dark" role="alert">
   5. Doubt solved by teacher
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options5" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options5" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options5" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options5" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options5" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options5" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>

<div class="alert alert-dark" role="alert">
   6. Practical Understanding
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options6" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options6" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options6" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options6" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options6" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options6" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>


<div class="alert alert-dark" role="alert">
   7. Overall rating to teacher.
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options7" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options7" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options7" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options7" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options7" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options7" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>
<!-- 
<div class="alert alert-dark" role="alert">
   8. Theoritical knowledge
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options8" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options8" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options8" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options8" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options8" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>


<div class="alert alert-dark" role="alert">
   9. Practical Understanding
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options9" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options9" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options9" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options9" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options9" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options9" id="option2" value="5" autocomplete="off">5
  </label>
</div>
<br><br>

<div class="alert alert-dark" role="alert">
   10. Overall rating to teacher.
</div> 
    
   <div class="col-sm btn-group btn-group-toggle align-content-center " data-toggle="buttons">
  
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options10" id="option2" value="0" autocomplete="off">0
  </label>
  <label class="col-2 btn btn-outline-danger">
    <input type="radio" name="options10" id="option2" value="1" autocomplete="off">1
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options10" id="option2" value="2" autocomplete="off">2
  </label>
  <label class="col-2 btn btn-outline-secondary">
    <input type="radio" name="options10" id="option2" value="3" autocomplete="off">3
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options10" id="option2" value="4" autocomplete="off">4
  </label>
  <label class="col-2 btn btn-outline-success">
    <input type="radio" name="options10" id="option2" value="5" autocomplete="off">5
  </label>
 <br><br>
</div> -->
 <button type="submit" class="btn btn-danger btn-lg btn-block">SUBMIT</button>
 </form>
</div>

<!---------------------------------------------------QUESTIONS END------------------------------------------------>       

      
      </div>
      
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