<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="DTO.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback Page</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("object")==null) 
response.sendRedirect("index.html");
%>
<pre><b>
Welcome ${object.getName()}
         ${object.getRoll()}
</b></pre>
<center>
<div style="overflow-x:auto;">
<table id="dataTable1" width="500px" border="1">

<% 
ArrayList<FacultyDto> myList = (ArrayList<FacultyDto>)request.getAttribute("list");
Iterator<FacultyDto> itr=myList.iterator();
while(itr.hasNext()){
	 FacultyDto st=itr.next();
	 String name=st.getName();
%>
<tr>
<td> <pre> 
<%= name %>
<%= st.getSubject() %>
<%= st.getBranch()%>
</pre></td>
<td>
<form action="Feedback" method="post" target="_blank">
<input type="hidden" name="fid" value="<%=st.getId() %>">
<input type="hidden" name="sid" value="${object.getRoll()}">
<input type="hidden" name="uname" value="<%=st.getName() %>">
<input type="hidden" name="subject" value="<%=st.getSubject() %>">
<input type="hidden" name="branch" value="<%=st.getBranch() %>">
<input type="submit" value="Give Feedback" name="givefeedback">
</form>
</td>
<%} %>
</tr>
</table>
</div>
</center>
</body>
</html>