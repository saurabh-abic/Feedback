package Servelet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDao;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	String user=request.getParameter("username");
	String pass=request.getParameter("password");
	AdminDao ad=new AdminDao();
	int i=ad.adminLogin(user,pass);
	if(i==0) {
		 out.println("<script type=\"text/javascript\">");
		   out.println("alert('Please Signup if already then check your Emailid or password');");
		   out.println("location='index.html';");
		   out.println("</script>");
	}
	else {
		  HttpSession session=request.getSession();
		   /* session.setMaxInactiveInterval(60);*/
		    session.setAttribute("name",user);
		    response.sendRedirect("Admin.jsp");
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
