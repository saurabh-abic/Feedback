package Class;
import java.util.*;

import DTO.OtpDto;
public  class OtpGenerator {
	public static long OTP()
    {
		int y=0;
		long x=0;
		int len=6;
        System.out.println("Generating OTP using random() : ");
        System.out.print("You OTP is : ");
        String numbers = "0123456789";
        Random rndm_method = new Random();
        OtpDto od=new OtpDto();
        char[] otp = new char[len];
 
        for (int i = 0; i < len; i++)
        {
            // Use of charAt() method : to get character value
            // Use of nextInt() as it is scanning the value as int
            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
        }
        System.out.println(Arrays.toString(otp));
        
		for (int i = 0; i < otp.length; i++) {
		    y = Integer.parseInt(String.valueOf(otp[i]));
		    x=10*x+y;
		    	}
	     od.setOtp(x);
	     new CheckOtp(od);
         return x;
    }
	
	/*public static void main(String... arg) {
		OtpGenerator.OTP();
		
		System.out.println(x);

}*/
}
