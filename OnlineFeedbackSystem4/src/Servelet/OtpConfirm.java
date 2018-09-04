package Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Class.CheckOtp;
@WebServlet("/OtpConfirm")
public class OtpConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String num,val;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	HttpSession session=request.getSession(false);
		
	    num=request.getParameter("otp");
	    val=String.valueOf(CheckOtp.met());
	     System.out.println("here");
		
	    
	    if(num.equals(val)) {
			response.sendRedirect("Home1.jsp");
		}
		else {
			response.sendRedirect("index.html");
		}
				
	}
	
	
}
