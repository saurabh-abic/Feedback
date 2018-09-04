package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Class.OtpModule;
import DAO.AdminDao;
import DTO.AddCounsellorDataDto;
import DTO.CounsellorAddDto;

/**
 * Servlet implementation class AddCounsellorData
 */
@WebServlet("/AddCounsellorData")
public class AddCounsellorData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		AddCounsellorDataDto acdd=null;
		AdminDao  ad=new AdminDao();;
		String fid=request.getParameter("fid");
		String name=request.getParameter("name");
		String cid=request.getParameter("cid");
		String pass=request.getParameter("pass");
		String sub="Regarding your id";
		String msg="Hello " +name+ " Faculty ID: " +fid+" Your counsellorid is " +cid+" and password is "+pass+" .";
		if(fid!=null) {
		 acdd=new AddCounsellorDataDto();
		 acdd.setCid(cid);
		 acdd.setFid(fid);
		 acdd.setName(name);
		 acdd.setPass(pass);
		
		String email=ad.insertCounsellor(acdd);
		if(email.equals("")) {
			  out.println("<script type=\"text/javascript\">");
	    	  out.println("alert('something wrong')");
			  out.println("</script>");	
		}
		else {
			 out.println("<script type=\"text/javascript\">");
			  out.println("alert('data uploaded ')"); 
			  out.println("</script>");	
		}
		
	
		String result=OtpModule.send(email,sub,msg);
		System.out.println(result);
		}
		     
		    ArrayList<AddCounsellorDataDto> arr=ad.getCounsellorData();
		    
	        request.setAttribute("list",arr);
	        request.getRequestDispatcher("AddCounsellor.jsp").forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
