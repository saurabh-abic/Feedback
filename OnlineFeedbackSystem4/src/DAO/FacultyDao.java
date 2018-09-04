package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import DTO.CounsellorAddDto;
import DTO.FacultyDto;
import DTO.StudentLoginDto;

public class FacultyDao {
private static FacultyDao u=new FacultyDao();
	
	static Connection  con;
	public static int flag=0;
		 public FacultyDao() {
			con=Dao.getCon();
		}
	
		 public static  FacultyDao getFacultyDao(){
			return u;
		}


public int insert(FacultyDto u) {
	int i=0;
	try{
		PreparedStatement ps3=con.prepareStatement("select * from facultydetails where id=?");
		ps3.setString(1, u.getId());
		ResultSet rs=ps3.executeQuery();
		if(rs.next()) {
			return 2;
		}
		else {
			
		PreparedStatement ps=con.prepareStatement("insert into facultydetails (name,id,email,pass,mob,dept,shift,counsellor)" + "values(?,?,?,?,?,?,?,?)");	
		ps.setString(1, u.getName());
		ps.setString(2, u.getId());
		ps.setString(3, u.getEmail());
		ps.setString(4, u.getPassword());
		ps.setString(5, u.getMob());
		ps.setString(6, u.getBranch());
		ps.setString(7, u.getShift());
		ps.setString(8, u.getCounsellor());
		ps.executeUpdate();
		i=1;
		ps.close();
		ps3.close();
		con.close();
		}
		}
		catch (Exception e) {
			i=0;
			System.out.println(""+e);
		}
		
		return i;
	
} 

public FacultyDto facultyLogin(FacultyDto fdt) {
	FacultyDto fdt1=null;
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("select * from facultydetails where id=? and pass=?");
		ps.setString(1,fdt.getId());
		ps.setString(2, fdt.getPassword());
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
     		fdt1=new FacultyDto();
			fdt1.setId(rs.getString("id"));
			fdt1.setName(rs.getString("name"));
			fdt1.setEmail(rs.getString("email"));
			fdt1.setMob(rs.getString("mob"));
			fdt1.setBranch(rs.getString("dept"));
			fdt1.setShift(rs.getString("shift"));
			fdt1.setPassword(rs.getString("pass"));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return fdt1;
}

public int updateFaculty(FacultyDto fdt) {
	int i=0;
	try {
		System.out.println(fdt.getId()+" "+fdt.getEmail()+" "+fdt.getMob()+" "+fdt.getPassword());
		PreparedStatement ps=con.prepareStatement("update facultydetails set email=?,pass=?,mob=? where id=?");
		ps.setString(1, fdt.getEmail());
		ps.setString(2, fdt.getPassword());
		ps.setString(3, fdt.getMob());
		ps.setString(4, fdt.getId());
		i=ps.executeUpdate();
		ps.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return i;
}


public String counsellorLogin(String cid,String pass) {
	boolean flag=false;
	String name=null;
	try {
		PreparedStatement ps=con.prepareStatement("select * from counsellor where counsellorid=? and pass=?");
		ps.setString(1,cid);
		ps.setString(2,pass);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			flag=true;
			name=rs.getString("name");
					}
		else 
			flag=false;
		ps.close();
	//	con.close();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
	
	return name;
}

public int counsellorAdd(CounsellorAddDto u) {
	int i=0;
	PreparedStatement ps;
	PreparedStatement ps1;
	 try {
		ps1=con.prepareStatement("select id from facultydetails where id=?");
		ps1.setString(1,u.getId());
		ResultSet rs1=ps1.executeQuery();
		if(rs1.next()) {
			
			
			 try{
				    ps=con.prepareStatement("select * from counselloradd where facultyid=? and subject=? and branch=? and year=? and sec=?");
					ps.setString(1,u.getId());
					ps.setString(2,u.getSubject());
					ps.setString(3,u.getBranch());
					ps.setString(4,u.getYear());
					ps.setString(5,u.getSec());
					
					ResultSet rs=ps.executeQuery();
					if(rs.next()) {
					  
				 i=1;
				} 
				
					else {
				ps = con.prepareStatement("insert into counselloradd (facultyid,subject,branch,year,sec,counsellorid)" + "values(?,?,?,?,?,?)");
				ps.setString(1, u.getId());
				ps.setString(2, u.getSubject());
				ps.setString(3, u.getBranch());
				ps.setString(4, u.getYear());
				ps.setString(5, u.getSec());
				ps.setString(6, u.getCid());
				ps.executeUpdate();
				i=2;
				//ps.close();
				//con.close();
					}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
			
		}
		else {
			i=3;
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	
	return i;
	
}


public ArrayList<CounsellorAddDto> getCounsellorAddData(String u) {
	PreparedStatement ps;
	ArrayList <CounsellorAddDto>arr=new ArrayList<CounsellorAddDto>();
	
	 try{
	    ps=con.prepareStatement("select * from counselloradd where counsellorid=?");
		ps.setString(1,u);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			CounsellorAddDto cad=new  CounsellorAddDto();
			cad.setId(rs.getString("facultyid"));
			cad.setSubject(rs.getString("subject"));
			cad.setBranch(rs.getString("branch"));
			cad.setYear(rs.getString("year"));
			cad.setSec(rs.getString("sec"));
			
			arr.add(cad);
		}
		Iterator<CounsellorAddDto> itr=arr.iterator();  
		   
		  while(itr.hasNext()){  
			  CounsellorAddDto st=itr.next();  
		    System.out.println(st.getId());  
		  }
		  
		  
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return arr;
}

public ArrayList<FacultyDto>  feedbackDetails(StudentLoginDto sldt) {
	PreparedStatement ps;
	ArrayList <FacultyDto>arr=new ArrayList<FacultyDto>();
	FacultyDto fdt;
    try {
		ps=con.prepareStatement("select * from facultydetails as f inner join counselloradd"
				+ " as c where f.id=c.facultyid and dept=? and year=? and sec=?");
		ps.setString(1, sldt.getBranch());
		ps.setString(2, sldt.getYear());
		ps.setString(3, sldt.getSection());
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			System.out.println("haiii");
			fdt=new FacultyDto();
			fdt.setId(rs.getString("facultyid"));
			fdt.setName(rs.getString("name"));
			fdt.setBranch(rs.getString("branch"));
			fdt.setYear(rs.getString("year"));
			fdt.setSubject(rs.getString("subject"));
			fdt.setSec(rs.getString("sec"));
			arr.add(fdt);	
		}
		Iterator<FacultyDto> itr=arr.iterator();  
		   
		  while(itr.hasNext()){  
			  FacultyDto st=itr.next();  
		    System.out.println(st.getName());  
		  }
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
return arr;
}

public int counsellorDel(CounsellorAddDto cad) {
int i=0;
	try {
		PreparedStatement ps=con.prepareStatement("delete from counselloradd where counsellorid=? and facultyid=? and subject=?");
		ps.setString(1, cad.getCid());
		ps.setString(2, cad.getId());
		ps.setString(3, cad.getSubject());
		i=ps.executeUpdate();
		ps.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return i;
}

}