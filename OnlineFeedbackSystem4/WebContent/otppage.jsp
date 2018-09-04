<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/main1.css">
<script type="text/javascript" src="js/main.js"></script>
<title>Student Feedback System</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>
 <div id="feedback-div">
   <form action="OtpConfirm" method="Get" class="form" id="feedback-form1" name="form1" enctype="multipart/form-data">
        <p class="otp">
			  <input name="otp" type="number" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" required placeholder="One Time Password" id="feedback-otp" />
		</p>
             <div class="feedback-submit" >
				<input type="submit" value="LOGIN" id="feedback-button-blue"/>
				<div class="feedback-ease"></div>
			</div>
 </form>
  </div>


</body>
</html>