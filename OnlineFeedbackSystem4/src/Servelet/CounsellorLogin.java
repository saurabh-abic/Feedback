package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FacultyDao;
import DTO.CounsellorAddDto;

/**
 * Servlet implementation class CounsellorLogin
 */
@WebServlet("/CounsellorLogin")
public class CounsellorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out=response.getWriter();
		String cid=request.getParameter("cid");
		String password=request.getParameter("password");
		System.out.println(cid);
		FacultyDao fda=new FacultyDao();
		String name=fda.counsellorLogin(cid, password);
		
		ArrayList<CounsellorAddDto> arr=fda.getCounsellorAddData(cid);
        System.out.print(arr.size());
		if(name!=null) {
			    HttpSession session=request.getSession();
				session.setAttribute("cid",cid);
				session.setAttribute("name",name );
				request.setAttribute("list",arr);
				request.getRequestDispatcher("CounsellorPage2.jsp").forward(request,response);
		}
		else
		{
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('please check your counsellorid and password or contact to admin ');");
			   out.println("location='index.html';");
			   out.println("</script>");	
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
