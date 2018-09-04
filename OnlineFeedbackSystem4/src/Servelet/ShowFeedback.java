package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDao;
import DTO.FeedbackDto;

@WebServlet("/ShowFeedback")
public class ShowFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fid=request.getParameter("fid");
		String name=request.getParameter("name");
		FeedbackDto fdt=new FeedbackDto();
		fdt.setFid(fid);
		fdt.setName(name);
		
		AdminDao fda=new AdminDao();
		FeedbackDto fdt1=fda.getFeedback(fdt);
		request.setAttribute("object",fdt1);
        request.getRequestDispatcher("ShowFeedback.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
