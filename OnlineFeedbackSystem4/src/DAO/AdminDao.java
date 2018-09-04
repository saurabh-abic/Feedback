package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import DTO.AddCounsellorDataDto;
import DTO.CounsellorAddDto;
import DTO.FacultyDto;
import DTO.FeedbackDto;

public class AdminDao {
private static AdminDao u=new AdminDao();
	
	static Connection  con;
	public static int flag=0;
		 public AdminDao() {
			con=Dao.getCon();
		}
	
		 public static  AdminDao getAdminDao(){
			return u;
		}
public String insertCounsellor(AddCounsellorDataDto acdd) {
	int i=0;
	String email="";
	try {
		PreparedStatement ps=con.prepareStatement("insert into counsellor (facultyid,name,counsellorid,pass) values(?,?,?,?)");
		ps.setString(1,acdd.getFid());
		ps.setString(2,acdd.getName());
		ps.setString(3, acdd.getCid());
		ps.setString(4, acdd.getPass());
		i=ps.executeUpdate();
		if(i>0) {
		PreparedStatement ps1=con.prepareStatement("select email from facultydetails where id=?");
		ps1.setString(1,acdd.getFid());
		ResultSet rs=ps1.executeQuery();
		if(rs.next()) {
			email=rs.getString("email");
		}
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return email;
}

public int adminLogin(String user,String pass) {
	int i=0;
	try {
		PreparedStatement ps=con.prepareStatement("select * from admin where user=? and pass=?");
		ps.setString(1, user);
		ps.setString(2, pass);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			i=1;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	return i;
	}

public ArrayList<AddCounsellorDataDto> getCounsellorData() {
	PreparedStatement ps;
	ArrayList <AddCounsellorDataDto>arr=new ArrayList<AddCounsellorDataDto>();
	
	 try{
	    ps=con.prepareStatement("select * from counsellor as c inner join facultydetails as d where c.facultyid=d.id");
		//ps.setString(1,u);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			AddCounsellorDataDto acdd=new AddCounsellorDataDto();
			acdd.setFid(rs.getString("facultyid"));
			acdd.setName(rs.getString("name"));
			acdd.setCid(rs.getString("counsellorid"));
			acdd.setPass(rs.getString("pass"));	
			acdd.setEmail(rs.getString("email"));
			arr.add(acdd);
		}
		Iterator<AddCounsellorDataDto> itr=arr.iterator();  
		   
		  while(itr.hasNext()){  
			  AddCounsellorDataDto st=itr.next();  
		    System.out.println(st.getFid());  
		  }
		  
		  
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return arr;
}
public int counsellorDel(AddCounsellorDataDto acdd) {
int i=0;
	try {
		PreparedStatement ps=con.prepareStatement("delete from counsellor where facultyid=?");
		ps.setString(1,acdd.getFid());
		i=ps.executeUpdate();
		ps.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return i;
}
public ArrayList<FacultyDto> searchFeedback(String param,String val) {
	PreparedStatement ps;
	FacultyDto fdt=null;
	ArrayList <FacultyDto>arr=new ArrayList<FacultyDto>();
	System.out.println("okk");
	if(val.equals("name")) {
		System.out.println("okkkkkk");
		 try {
			ps=con.prepareStatement("select * from facultydetails where name like '%"+param+"%' order by name asc");
		//	ps.setString(1, param);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				System.out.println("okkkkkk");
				
				fdt=new FacultyDto();
				fdt.setId(rs.getString("id"));
				fdt.setName(rs.getString("name"));
				fdt.setBranch(rs.getString("dept"));
				arr.add(fdt);
				
			}
			Iterator<FacultyDto> itr=arr.iterator();  
			   
			  while(itr.hasNext()){  
				  FacultyDto st=itr.next();  
			    System.out.println(st.getId());  
			  }
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	else if(val.equals("id")) {
		 try {
			 System.out.println("okkkkkk");
				ps=con.prepareStatement("select * from facultydetails where id like '%"+param+"%' order by id asc");
			//	ps.setString(1, param);
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					System.out.println("data available");
					fdt=new FacultyDto();
					fdt.setId(rs.getString("id"));
					fdt.setName(rs.getString("name"));
					fdt.setBranch(rs.getString("dept"));
					arr.add(fdt);
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
	}
	else if(val.equals("branch")) {
		 try {
				ps=con.prepareStatement("select * from facultydetails where dept like '%"+param+"%' order by dept asc");
				ResultSet rs=ps.executeQuery();
				while(rs.next()){
					fdt=new FacultyDto();
					fdt.setId(rs.getString("id"));
					fdt.setName(rs.getString("name"));
					fdt.setBranch(rs.getString("dept"));
					arr.add(fdt);
					
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}
	return arr;
}

public FeedbackDto getFeedback(FeedbackDto fdt) {
	PreparedStatement ps;
	FeedbackDto fdt1=null;
	
	try {
		ps=con.prepareStatement("select * from feedback where facultyid=?");
		ps.setString(1, fdt.getFid());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			fdt1=new FeedbackDto();
			fdt1.setFid(rs.getString("facultyid"));
			fdt1.setOne(rs.getInt("one"));
			fdt1.setTwo(rs.getInt("two"));
			fdt1.setThree(rs.getInt("three"));
			fdt1.setFour(rs.getInt("four"));
			fdt1.setFive(rs.getInt("five"));
			fdt1.setSix(rs.getInt("six"));
			fdt1.setSeven(rs.getInt("seven"));
			fdt1.setTotal(rs.getInt("total"));
			fdt1.setName(fdt.getName());
			
		}
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return fdt1;
}

public ArrayList<FacultyDto> viewCounsellorData() {
	PreparedStatement ps;
	ArrayList <FacultyDto>arr=new ArrayList<FacultyDto>();
	
	 try{
	    ps=con.prepareStatement("select * from facultydetails where counsellor='yes'");
		//ps.setString(1,u);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			FacultyDto fdt1=new FacultyDto();
			fdt1.setId(rs.getString("id"));
			fdt1.setName(rs.getString("name"));
			fdt1.setEmail(rs.getString("email"));
			fdt1.setMob(rs.getString("mob"));
			fdt1.setBranch(rs.getString("dept"));
			fdt1.setShift(rs.getString("shift"));
			
			arr.add(fdt1);
		}
		Iterator<FacultyDto> itr=arr.iterator();  
		   
		  while(itr.hasNext()){  
			  FacultyDto st=itr.next();  
		    System.out.println(st.getId());  
		  }
		  
		  
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return arr;
}

}
