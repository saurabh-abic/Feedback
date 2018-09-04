package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FacultyDao;
import DAO.StudentLLoginDao;
import DTO.FacultyDto;
import DTO.StudentLoginDto;

/**
 * Servlet implementation class FeedbackPage
 */
@WebServlet("/FeedbackPage")
public class FeedbackPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	    HttpSession session=request.getSession(false);
	 	    StudentLoginDto sldt=(StudentLoginDto) session.getAttribute("object");
			if(session.getAttribute("object")!=null) {
				System.out.println("exist");
				String name=sldt.getName();
				String branch=sldt.getBranch();
				String Year=sldt.getYear();
				String section=sldt.getSection();
				StudentLoginDto sldt1=new StudentLoginDto();
				
				sldt1.setBranch(branch);
				sldt1.setYear(Year);
				sldt1.setSection(section);			
		    	FacultyDao u=new FacultyDao();
		    	
			ArrayList<FacultyDto> arr=	u.feedbackDetails(sldt1);
			request.setAttribute("list",arr);
			request.getRequestDispatcher("GiveFeedback2.jsp").forward(request,response);		
			}
			else {
			
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
