package Class;

import DTO.OtpDto;

public class CheckOtp {
	static long val;
	CheckOtp(OtpDto od){
		val=od.getOtp();
	}
	public static long met() {
          	return val;
	}

}
