package Servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Class.OtpGenerator;
import Class.OtpModule;
import DAO.StudentLLoginDao;
import DTO.StudentLoginDto;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String Email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		StudentLoginDto sld=new StudentLoginDto();
		sld.setEmail(Email);
		sld.setPassword(pass);
		
	    StudentLLoginDao slld=new StudentLLoginDao();
		StudentLoginDto sld1=slld.studentLogin(sld);
		
		if(sld1==null) {
			  
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Please Signup if already then check your Emailid or password');");
			   out.println("location='index.html';");
			   out.println("</script>");
			//out.println("<http><body>your data is not available please check id and password or signup</body></http>");	
		}
		
		else {
		//	out.println("<http><body>welcome to the feedback page</body></http>");
			     long code=OtpGenerator.OTP();
	 		  
		 	//	  OtpConfirm.getOtp(Arrays.toString(code));
			     System.out.println(code);
		 		 String msg=" Your one time password is " +code+". This is only"
		 		 		+ " valid for 10 min. Login with that and give your precious feedback. ";
		 		 String sub="Feeback OTP";
		 		 OtpModule.send(Email,sub,msg);		
		             HttpSession session=request.getSession();
				    session.setAttribute("object",sld1);
				    session.setMaxInactiveInterval(300);
					response.sendRedirect("otppage.jsp");
					System.out.print("submitted");
				   
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
