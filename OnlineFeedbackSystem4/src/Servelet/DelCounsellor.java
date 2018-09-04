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

/**
 * Servlet implementation class DelCounsellor
 */
@WebServlet("/DelCounsellor")
public class DelCounsellor extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fid=request.getParameter("fid");
		AddCounsellorDataDto acdd=new AddCounsellorDataDto();
		acdd.setFid(fid);
		AdminDao ad=new AdminDao();
		ad.counsellorDel(acdd);
		ArrayList<AddCounsellorDataDto> arr=ad.getCounsellorData();
	    request.setAttribute("list",arr);
	    request.getRequestDispatcher("AddCounsellor.jsp").forward(request,response);
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
