package Servelet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FacultyDao;
import DTO.FacultyDto;

@WebServlet("/FacultySignup")
public class FacultySignup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		 String id=request.getParameter("id");;
		// String section=request.getParameter("");
		 String email=request.getParameter("email");
	     String password=request.getParameter("password");
		 String dept=request.getParameter("branch");
		 String mob=request.getParameter("mobile");
		 String shift=request.getParameter("shift");
		 String counsellor=request.getParameter("counsellor");
		 
		 if(mob.length()!=10) {
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('Enter correct mobile no.');");
			   out.println("location='index.html';");
			   out.println("</script>");
			 
		 }
		 else {
		 FacultyDto fdt=new FacultyDto(); 
		 System.out.println(email);
		 System.out.println(id);
		 System.out.println(name);
		 System.out.println(dept);
		 System.out.println(mob);
		 fdt.setBranch(dept);
		 fdt.setEmail(email);
		 fdt.setId(id);
		 fdt.setMob(mob);
		 fdt.setName(name);
		 fdt.setPassword(password);
		 fdt.setShift(shift);
		 fdt.setCounsellor(counsellor);
		 
		
		 System.out.println(password);
		 FacultyDao fda=new FacultyDao();
		 int i= fda.insert(fdt);
		 if(i==1) {
				//System.out.println("update");
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Signup Successfully');");
				   out.println("location='index.html';");
				   out.println("</script>");
				  
			}
			
			else if(i==2) {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('You are already registered please signin for further process');");
				   out.println("location='index.html';");
				   out.println("</script>");
				
			}
			else {
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('your data is not updated please try again after some time');");
				   out.println("location='index.html';");
				   out.println("</script>");
				
			}	 
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
