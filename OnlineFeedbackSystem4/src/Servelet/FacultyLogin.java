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
 * Servlet implementation class FacultyLogin
 */
@WebServlet("/FacultyLogin")
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		String id=request.getParameter("fid");
		String pass=request.getParameter("password");
		FacultyDto fdt=new FacultyDto();
		fdt.setId(id);
        fdt.setPassword(pass);	
        FacultyDao fda=new FacultyDao();
        FacultyDto fdt1=fda.facultyLogin(fdt);
        if(fdt1==null) {
        	   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Please Signup if already then check your Facultyid or password');");
			   out.println("location='index.html';");
			   out.println("</script>");
        }
        else {
        	    HttpSession session=request.getSession();
			    session.setAttribute("object",fdt1);
				response.sendRedirect("FacultyPage.jsp");
				
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
