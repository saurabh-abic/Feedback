package Servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDao;
import DAO.FacultyDao;
import DTO.AddCounsellorDataDto;
import DTO.CounsellorAddDto;

/**
 * Servlet implementation class CounsellorDel
 */
@WebServlet("/CounsellorDel")
public class CounsellorDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String fid=request.getParameter("fid");
	String subject=request.getParameter("subject");
	String cid=request.getParameter("cid");
	
	CounsellorAddDto cad=new CounsellorAddDto();
	cad.setCid(cid);
	cad.setId(fid);
	cad.setSubject(subject);
	FacultyDao fda=new FacultyDao();
	int i=fda.counsellorDel(cad);
	
	ArrayList<CounsellorAddDto> arr=fda.getCounsellorAddData(cid);
    request.setAttribute("list",arr);
    request.getRequestDispatcher("CounsellorPage2.jsp").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
