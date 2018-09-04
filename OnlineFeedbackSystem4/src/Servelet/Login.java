package Servelet;
import Class.*;
import Servelet.*;
import java.io.IOException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
	
		response.setContentType("text/html");
 		String Username=request.getParameter("name");
 		String Password=request.getParameter("password");
 	      String Email= request.getParameter("id");
 	        System.out.println(Email);
 	       System.out.println(Username);
 	      System.out.println(Password);
 		  long code=OtpGenerator.OTP();
 		  
 		//  OtpConfirm.getOtp(Arrays.toString(code));
 		  System.out.println(code);
 		 String msg=" Your one time password is "+ code +". This is only"
 		 		+ " valid for 10 min. Login with that and give your precious feedback. ";
 		 String sub="Feeback OTP";
 		 OtpModule.send(Email,sub,msg);		
		if(Username.equals(Password)){
			HttpSession session=request.getSession();
			session.setAttribute("name",Username);
			response.sendRedirect("otppage.html");
			System.out.print("submitted");
	}
	
	

}
}

