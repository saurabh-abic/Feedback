<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="DTO.CounsellorAddDto" %>
   <%@ page import="DAO.FacultyDao" %>
    <%@ page import=" java.util.ArrayList" %>
    <%@ page import="java.util.Iterator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/mains.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- Session Handling -->

<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session.getAttribute("cid")==null) 
response.sendRedirect("index.html");

String ccid=(String)session.getAttribute("cid");
String name=(String)session.getAttribute("name");
%>

<!--  -->
<pre>
<b>
Welcome <%=name %>
</b>

<form action="CounsellorAdd" method="post">

CounsellorId :- <input type="text" name="cid" id="cid" value=${cid}> <br/>

Faculty Id :-   <input type="text" name="fid" id="fid" required/> <br/>
Enter Subject :-<input type="text" name="subject" id="subject" required /><br/>
Branch:-         <select name="branch" id="branch">
         <option selected>Computer Science</option>
        <option>Civil Engineering</option>
        <option>Electronics</option>
        <option>Electrical</option>
        <option>Information Technology</option>
        <option>Mechanical</option>
</select><br/>
Year:-          <select name="year" id="year">
            <option>First</option>
          <option>Second</option>
            <option>Third</option>
            <option>Fourth</option>
           </select><br/>
Section:-       <select name="sec" id="section"> 
          <option>A</option>
           <option>B</option>
             <option>C</option>
           <option>D</option>
</select><br/>

<!-- <button name="add" onclick="return getData()">add</button> -->

 <input type="submit" value ="add" id="button" name="button" />

</form>
</pre>
<form action="" method="post">
<table id="dataTable" width="500px" border="1">
  <tr>
     <th>S.No.</th>
    <th>Faculty Id</th>
    <th>Subject</th> 
    <th>Branch</th>
    <th>Year</th>
    <th>Section</th>
    <th></th>
  </tr>

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
	  <td><input type="checkbox" name="delete"></td>
	  </tr>
	<%
                 }            }
//}
%>
</table>
</form>
</body>
</html>