<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="DTO.*" %>
   <%@ page import="DAO.FacultyDao" %>
    <%@ page import=" java.util.ArrayList" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="java.util.*" %>
    <%@ page errorPage="error.jsp" %> 
    <%-- <%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>View Feedback</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets1/css/main.css" />
		<!-- Main CSS -->
     <link href="css/main.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <script type="text/javascript" src="js/mains.js"></script>
     <script src="js/canvasjs.min.js"></script>
     <script>
window.onload = function () {

	<% 
	FeedbackDto fdt=(FeedbackDto)request.getAttribute("object");
	String fid=null,name=null;
	int total=1;
	float one=0,two=0,three=0,four=0,five=0,six=0,seven=0,overall=0;
	if(fdt==null){}
	else{
	fid=fdt.getFid();
	 name=fdt.getName();
  total=fdt.getTotal();
 one=fdt.getOne()*100/total;
 two=fdt.getTwo()*100/total;
 three=fdt.getThree()*100/total;
  four=fdt.getFour()*100/total;
 five=fdt.getFive()*100/total;
 six=fdt.getSix()*100/total;
 seven=fdt.getSeven()*100/total;
overall=(fdt.getOne()+fdt.getTwo()+fdt.getThree()+fdt.getFour()+fdt.getFive()+fdt.getSix()+fdt.getSeven())*100/(7*total);

	}
	

	%>
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	 exportEnabled: true,
	theme: "dark2", // "light1", "light2", "dark1", "dark2"
	title:{
		text: "Feedback Result of <%=name%>"
	},
	axisY: {
		title: "Get"
	},
	data: [{        
		type: "column",  
		showInLegend: true, 
		legendMarkerColor: "grey",
		legendText: "Questions",
		dataPoints: [      
			{ y: <%=one%>, label: "Learning Value" },
			{ y: <%=two%>,  label: "Applicability" },
			{ y: <%=three%>,  label: "Depth of content" },
			{ y: <%=four%>,  label: "Coverage" },
			{ y: <%=five%>,  label: "Doubt Solved" },
			{ y: <%=six%>, label: "Practical Understanding" },
			{ y: <%=seven%>,  label: "Overall Exprirence" },
			{ y: <%=overall%>,  label: "Overall Feedback" }
		]
	}]
});
chart.render();

}
</script>    
</head>
<body>


<section id="main">
				<div class="inner">
					<div class="wrapper style1">
						<div class="content">
						
						<% 
/* FeedbackDto fdt=(FeedbackDto)request.getAttribute("object");*/
if( fdt==null){ 
	%>
	<center>
	<label><font size="10">He got no feedback yet</font></label>
	</center>
	
	
	
	<% 
} else{
%>
						 <div class="12u$">
                                        <!-- Table -->
											
											<h4>ID : <%=fid %></h4>
											<h4>Name : <%=name %></h4>
                                           <br/>
											<h3>Feedback Result</h3>
											<br/>
											<div class="table-wrapper" style="overflow-x:auto;">
												<table>
													<thead>
														<tr>
															  <th>Questions</th>
                                                            <th>Got %</th>
                                                               
                                                                
														</tr>
													</thead> 
						
						
	<tbody>
		<tr>
       <td>
	 <label >Learning value (in terms of skills,concepts, knowledge)  </label>
	  </td>
	  <td>
	 <label><%=one %></label>
	  </td>
   </tr>
   
   	<tr>
       <td>
	  <label>Applicability/relevance to real life situations	</label>
	  </td>
	  <td> <label>
	 <%=two %>
	 </label>
	  </td>
   </tr>
   
   	<tr>
       <td><label>
	 Depth of the course content
	  </label>
	  </td>
	  <td>
	   <label>
	 <%=three %>
	 </label>
	  </td>
   </tr>
   
   	<tr>
       <td>
	 <label>Extent of coverage of course</label>
	  </td>
	  <td> <label>
	 <%=four%>
	  </label></td>
   </tr>
   
   	<tr>
       <td>
	 <label>Doubt solved by teacher</label>
	  </td>
	  <td> <label>
	 <%=five %></label>
	  </td>
   </tr>
   
   	<tr>
       <td>
	 <label>	Practical Understanding  </label>
	  </td>
	  <td> <label>
	 <%=six %></label>
	  </td>
   </tr>
   
   	<tr>
       <td><label>
	 your overall experience
	 </label>
	  </td>
	  <td> <label>
	 <%=seven %></label>
	  </td>
   </tr>
   
    	<tr>
       <td><label> Overall You Get</label>
	  </td>
	  <td> <label>
	 <%=overall %></label>
	  </td>
   </tr>
   </tbody>
												
													
												</table>
											</div>
											</div>
											<br/>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 10px auto;"></div>

						</div>
						<% } %>		
						</div>
					</div>
					
			<!-- </div> -->
</section>
</body>
</html>