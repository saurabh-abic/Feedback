package Servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentLLoginDao;
import DTO.FeedbackDto;

/**
 * Servlet implementation class FeedbackValue
 */
@WebServlet("/FeedbackValue")
public class FeedbackValue extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String fid=request.getParameter("fid");
	    String sid=request.getParameter("sid");
	    String subject=request.getParameter("subject");
		int one=Integer.valueOf(request.getParameter("options"));
		int two=Integer.valueOf(request.getParameter("options2"));
		int three=Integer.valueOf(request.getParameter("options3"));
		int four=Integer.valueOf(request.getParameter("options4"));
		int five=Integer.valueOf(request.getParameter("options5"));
		int six=Integer.valueOf(request.getParameter("options6"));
		int seven=Integer.valueOf(request.getParameter("options7"));
		/*int eight=Integer.valueOf(request.getParameter("options8"));
		int nine=Integer.valueOf(request.getParameter("options9"));
		int ten=Integer.valueOf(request.getParameter("options10"));*/
		FeedbackDto fdt=new FeedbackDto();
		fdt.setFid(fid);
		fdt.setSid(sid);
		fdt.setSubject(subject);
		fdt.setOne(one);
		fdt.setTwo(two);
		fdt.setThree(three);
		fdt.setFour(four);
		fdt.setFive(five);
		fdt.setSix(six);
		fdt.setSeven(seven);
		StudentLLoginDao slld=new StudentLLoginDao();
		int i=slld.feedbackInsert(fdt);
		if(i==1) {
			response.sendRedirect("confirm.html");
		}
		System.out.println(one);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
