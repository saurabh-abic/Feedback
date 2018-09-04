package Servelet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FacultyDao;
import DTO.FacultyDto;

/**
 * Servlet implementation class UpdateFaculty
 */
@WebServlet("/UpdateFaculty")
public class UpdateFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
	HttpSession session=request.getSession(false);
	FacultyDto fdt1=(FacultyDto)session.getAttribute("object");
	System.out.println(fdt1.getId());
	String mob=request.getParameter("mob");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	FacultyDto fdt=new FacultyDto();
	fdt.setId(fdt1.getId());
	fdt.setEmail(email);
	fdt.setPassword(pass);
	fdt.setMob(mob);
	FacultyDao fda=new FacultyDao();
	int i=fda.updateFaculty(fdt);
	if(i==0) {
		out.println("<script type=\"text/javascript\">");
		   out.println("alert('Data Not Updated try after some time');");
		   out.println("location='FacultyPage.jsp';");
		   out.println("</script>");
	}
	else {
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Details Updated');");
		   out.println("location='FacultyPage.jsp';");
		   out.println("</script>");
	}
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
