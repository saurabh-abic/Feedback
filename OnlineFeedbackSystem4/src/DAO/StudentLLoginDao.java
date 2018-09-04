package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.FeedbackDto;
import DTO.StudentLoginDto;

public class StudentLLoginDao {
	
	private static StudentLLoginDao u=new StudentLLoginDao();
	
	static Connection  con;
	public static int flag=0;
		 public StudentLLoginDao() {
			con=Dao.getCon();
		}
	
		 public static  StudentLLoginDao getStudentDao(){
			return u;
		}
		 
		 public int insert(StudentLoginDto u){
				int i=0;
				
				try{
				PreparedStatement ps3=con.prepareStatement("select * from studentid where id=?");
				ps3.setString(1, u.getRoll());
				ResultSet rs=ps3.executeQuery();
				if(rs.next()) {
					return 2;
				}
				else {
					
				PreparedStatement ps=con.prepareStatement("insert into studentid (Name,id,email,pass)" + "values(?,?,?,?)");	
				ps.setString(1, u.getName());
				ps.setString(2, u.getRoll());
				ps.setString(3, u.getEmail());
				ps.setString(4, u.getPassword());
				ps.executeUpdate();
				
				PreparedStatement ps1=con.prepareStatement("insert into studentdetails(id,fname,mname,mob,year,branch,sec)"+"values(?,?,?,?,?,?,?)");
				ps1.setString(1,u.getRoll());
				ps1.setString(2,u.getFname());
				ps1.setString(3,u.getMname());
				ps1.setString(4,u.getMob());
				ps1.setString(5,u.getYear());
				ps1.setString(6,u.getBranch());
				ps1.setString(7,u.getSection());
				
				i=ps1.executeUpdate();
				ps1.close();
				ps.close();
				ps3.close();
			
				}
				}
				catch (Exception e) {
					System.out.println(""+e);
				}
				
				return i;
				
			
		 }
		 public StudentLoginDto studentLogin(StudentLoginDto u) {
			 StudentLoginDto so=null;
			System.out.println(u.getEmail());
			 try {
				 PreparedStatement ps=con.prepareStatement("select * from studentid where email=? and pass=? ");
				 ps.setString(1,u.getEmail());
				 ps.setString(2,u.getPassword());
				 ResultSet rs=ps.executeQuery();
				 if(rs.next()) {
					 
					 System.out.println("here");
					 PreparedStatement ps1=con.prepareStatement("select * from studentdetails where id=? ");
					 ps1.setString(1,rs.getString(2));
					 ResultSet rs1=ps1.executeQuery();
					 rs1.next(); 
						so=new StudentLoginDto();
						so.setName( rs.getString(1));
						so.setRoll( rs.getString(2));
						so.setEmail( rs.getString(3));
						so.setPassword( rs.getString(4));
					
						so.setFname( rs1.getString(2));
						so.setMname( rs1.getString(3));
				        so.setMob( rs1.getString(4));
						so.setYear( rs1.getString(5));
						so.setBranch(rs1.getString(6));
						so.setSection(rs1.getString(7));
					 //   so.setPassword(rs.getString(10)); 
				    
					   System.out.println("datails available");
						
					   ps1.close();
					   ps.close();
			
					  
				 }
				 else {
					
					 System.out.println("details not available please signup");
					 
				 }
					 }
			 catch(Exception e){
				 e.printStackTrace();
			 }
			 
			 return so;
		 }

		 public int  feedbackInsert(FeedbackDto fdt) {
			 int i=0;
			 try {
				PreparedStatement ps1=con.prepareStatement("select * from feedback where facultyid=?");
				ps1.setString(1,fdt.getFid());
				ResultSet rs1=ps1.executeQuery();
				if(rs1.next()) {
					int one=rs1.getInt("one")+fdt.getOne();
					int two=rs1.getInt("two")+fdt.getTwo();
					int three=rs1.getInt("three")+fdt.getThree();
					int four=rs1.getInt("four")+fdt.getFour();
					int five=rs1.getInt("five")+fdt.getFive();
					int six=rs1.getInt("six")+fdt.getSix();
					int seven=rs1.getInt("seven")+fdt.getSeven();
					int total=rs1.getInt("total")+5;
					
					PreparedStatement ps=con.prepareStatement("update feedback set one=?,two=?,three=?,four=?,five=?,six=?,"
							+ "seven=? ,total=? where facultyid=?");
					
				//	ps.setString(2,fdt.getSid());
				//	ps.setString(3,fdt.getSubject());
					ps.setInt(1,one);
					ps.setInt(2,two);
					ps.setInt(3,three);
					ps.setInt(4,four);
					ps.setInt(5,five);
					ps.setInt(6,six);
					ps.setInt(7,seven);
					ps.setInt(8, total);
			    	ps.setString(9,fdt.getFid());
					ps.executeUpdate();
					i=1;
					ps.close();
					
					
					
				}
				else {
					PreparedStatement ps=con.prepareStatement("insert into feedback(facultyid,"
							+ "one,two,three,four,five,six,seven,total)"+" values(?,?,?,?,?,?,?,?,?) ");
					ps.setString(1,fdt.getFid());
				//	ps.setString(2,fdt.getSid());
				//	ps.setString(3,fdt.getSubject());
					ps.setInt(2,fdt.getOne());
					ps.setInt(3,fdt.getTwo());
					ps.setInt(4,fdt.getThree());
					ps.setInt(5,fdt.getFour());
					ps.setInt(6,fdt.getFive());
					ps.setInt(7,fdt.getSix());
					ps.setInt(8,fdt.getSeven());
					ps.setInt(9,5);
					ps.executeUpdate();
					i=1;
					ps.close();
					
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 
			 try {
				PreparedStatement ps2=con.prepareStatement("insert into feedbackdetails(facultyid,"
							+ "studentid,subject)"+" values(?,?,?) ");
				ps2.setString(1, fdt.getFid());
				ps2.setString(2, fdt.getSid());
				ps2.setString(3, fdt.getSubject());
				ps2.executeUpdate();
				ps2.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
				return i;
		 }
		 
		 public boolean check(FeedbackDto fdto) {
			 boolean flag=false;
			 try {
				 System.out.println(fdto.getFid()+" "+fdto.getSid()+" "+fdto.getSubject());
				PreparedStatement ps=con.prepareStatement("select * from feedbackdetails where facultyid=? and studentid=? and subject=?");
				ps.setString(1, fdto.getFid());
				ps.setString(2, fdto.getSid());
				ps.setString(3, fdto.getSubject());
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					System.out.println("exixt krta haii");
					flag=true;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 
			 return flag;
		 }

}
