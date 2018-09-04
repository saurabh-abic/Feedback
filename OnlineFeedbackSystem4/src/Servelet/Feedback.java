package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentLLoginDao;
import DTO.FacultyDto;
import DTO.FeedbackDto;


@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String name=request.getParameter("uname");
		String sid=request.getParameter("sid");
		String fid=request.getParameter("fid");
		String subject=request.getParameter("subject");
		String branch=request.getParameter("branch");
		FacultyDto fdt=new FacultyDto();
		
		fdt.setBranch(branch);
		fdt.setName(name);
		fdt.setId(fid);
		fdt.setSubject(subject);
	    StudentLLoginDao slld=new StudentLLoginDao();
	    
	    FeedbackDto fdto=new FeedbackDto();
	    fdto.setFid(fid);
	    fdto.setSid(sid);
	    fdto.setSubject(subject);
	     boolean status=slld.check(fdto);
	     if(status==true) {
	    	 response.sendRedirect("Error.html");
	     }
	     else {
	    ArrayList<FacultyDto> arr=new ArrayList<>();
		arr.add(fdt);
		    
		    request.setAttribute("list",arr);
	        request.getRequestDispatcher("FeedbackPage2.jsp").forward(request,response);
	     }	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
