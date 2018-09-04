package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDao;
import DTO.FacultyDto;

@WebServlet("/SearchFeedback")
public class SearchFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val=request.getParameter("search");
		String param=request.getParameter("name");
		AdminDao ad=new AdminDao();
		ArrayList<FacultyDto> arr=ad.searchFeedback(param,val);
		request.setAttribute("list",arr);
        request.getRequestDispatcher("FeedbackByName.jsp").forward(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
