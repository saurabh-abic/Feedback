package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FacultyDao;
import DTO.CounsellorAddDto;

/**
 * Servlet implementation class CounsellorAdd
 */
@WebServlet("/CounsellorAdd")
public class CounsellorAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

		/*if(session.getAttribute("cid")==null) 
		response.sendRedirect("index.html");
		String ccid=(String)session.getAttribute("cid");*/
		
		
		PrintWriter out=response.getWriter();
		
		String fid=request.getParameter("fid");
		String cid=request.getParameter("cid");
		String subject=request.getParameter("subject");
		String branch=request.getParameter("branch");
		String year=request.getParameter("year");
		String section=request.getParameter("sec");
		FacultyDao fda=new FacultyDao();
		CounsellorAddDto cad=new CounsellorAddDto();
		
		if(section!=null){
		cad.setBranch(branch);
		cad.setId(fid);
		cad.setSec(section);
		cad.setSubject(subject);
		cad.setYear(year);
		cad.setCid(cid);

		int i=fda.counsellorAdd(cad);
		if(i==2){
			
			  out.println("<script type=\"text/javascript\">");
			  out.println("alert('data uploaded ')");
			  out.println("</script>");	
			  
		}
		else if(i==1) {}
		else if(i==3) {
			 out.println("<script type=\"text/javascript\">");
			  out.println("alert('Ask this faculty for signup first')");
			  out.println("</script>");	
			  System.out.println("signup first");
		}
		else {
			 out.println("<script type=\"text/javascript\">");
			  out.println("alert('data not uploaded ')");
			  out.println("</script>");	
		}
		    ArrayList<CounsellorAddDto> arr=fda.getCounsellorAddData(cid);
	        request.setAttribute("list",arr);
	        request.getRequestDispatcher("CounsellorPage2.jsp").forward(request,response);
		}
		
		
		   
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
