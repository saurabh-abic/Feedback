<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/main.css">
<title>Home Page</title>
</head>
<body>
<div id="main">
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>
<center>
Hello ${object.getRoll()} 
<br/>
Welcome to the Feedback Page
</center>
<br/>
<br/>
<br/>
<center>

<div id="notice">
             <u><center><label for="news"><b>Notice</b></label></center></u>
             <br/><br/><br/>
             <marquee direction=up scrolldelay=200 height=150>
         <li>Please fill the feedback wisely  </li>
         <li>This Site Under Construction</li>
         <li>The tentative month for completion is May </li>

             </marquee>
                 </div>
                 </center>
 </div>
       
        <center>
          <form action="FeedbackPage" method="post">
          <input type ="submit" name="start" id="start" value="Start Feedback">
          </form>>
       </center>          
                 
 
</body>

</html>