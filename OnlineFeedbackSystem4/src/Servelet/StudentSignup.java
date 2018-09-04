package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.StudentLLoginDao;
import DTO.StudentLoginDto;


@WebServlet("/StudentSignup")
public class StudentSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	
		PrintWriter out=response.getWriter();
		String name=request.getParameter("name");
		 String roll=request.getParameter("id");;
		 String fname=request.getParameter("fname");
		 String mname=request.getParameter("mname");
		 String section=request.getParameter("section");
		 String email=request.getParameter("email");
	     String password=request.getParameter("password");
	     String year=request.getParameter("year");
		 String branch=request.getParameter("branch");
		 String mob=request.getParameter("mob");
		 Date date=new Date();
		 int month=date.getMonth();
		int cyr=Integer.valueOf(String.valueOf(date.getYear()).substring(1));
		int lyr=cyr-4;
		int first=Integer.valueOf(roll.substring(0,2));
		String second=roll.substring(2,5);
		int third=Integer.valueOf(roll.substring(7));
	
		String clgcode="033";
		int min=1;
		int max=240;
		System.out.println(cyr+" "+lyr+" "+first+" "+second+" "+third+" "+ min+" "+max+" "+month);
		if((cyr==first && month<7)|| (lyr==first && month>7)) {
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Enter correct roll no.');");
			   out.println("location='index.html';");
			   out.println("</script>");
		}
	
		else if(first<lyr || first>cyr || !second.equals(clgcode) || third<min || third>max || roll.length()<10 ) {
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Enter correct roll no.');");
			   out.println("location='index.html';");
			   out.println("</script>");	
		}
		
		else if(mob.length()!=10) {
			 out.println("<script type=\"text/javascript\">");
			   out.println("alert('Enter correct mobile no.');");
			   out.println("location='index.html';");
			   out.println("</script>");
			 
		 }
		 else {
		 StudentLoginDto sld=new StudentLoginDto();
		
	     sld.setBranch(branch);
		 sld.setEmail(email);
		 sld.setFname(fname);
		 sld.setMname(mname);
		 sld.setMob(mob);
		 sld.setName(name);
		 sld.setPassword(password);
		 sld.setRoll(roll);
		 sld.setYear(year);
		 sld.setSection(section);
		 StudentLLoginDao u=StudentLLoginDao.getStudentDao();
		int i= u.insert(sld);
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
		
		/* System.out.println(email);
		 System.out.println(roll);
		 System.out.println(name);
		 System.out.println(year);
		 System.out.println(branch);
		 System.out.println(mob);
		 System.out.println(fname);
		 System.out.println(mname);
		 System.out.println(password);*/
		 
		
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
