package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDao;
import DTO.AddCounsellorDataDto;
import DTO.FacultyDto;

/**
 * Servlet implementation class ViewCounsellor
 */
@WebServlet("/ViewCounsellor")
public class ViewCounsellor extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		AdminDao ad=new AdminDao();
		ArrayList<FacultyDto> arr=ad.viewCounsellorData();
		request.setAttribute("list",arr);
        request.getRequestDispatcher("ViewCounsellor.jsp").forward(request,response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
