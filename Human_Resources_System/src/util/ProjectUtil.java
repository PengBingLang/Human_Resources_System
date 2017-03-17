package util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import attendance.AttendanceCountService;
import entity.attendanceInfoTab;

public class ProjectUtil {
	private AttendanceCountService service = new AttendanceCountService();
	// 查询正常出勤次数
	public int getcountAttendance(String employeeNumber,String bgingTime,String endTime ){
		
		int counts = 0;  // 正常出勤的次数
		String temp=""; // 第三方变量用于存放上一次遍历到的日期
		String startDate = "08:00:00"; // 正常上班的时间
		String endDate = "16:00:00"; // 正常下班时间
		DateFormat dt = new SimpleDateFormat("HH:mm:ss"); // 指定时间格式
		
		List<attendanceInfoTab> list = service.getCountAttendance(employeeNumber,bgingTime,endTime);
		for(attendanceInfoTab att : list){
			//  比较上一次的年月日和本次的年月日是否相同，则判断数据是否是同一天的上班和下班签到
			if(temp != "" && temp.substring(0, 10).equals(att.getAttendanceDate().substring(0, 10))){
				try {
					Date sd = dt.parse(startDate);
					Date ed = dt.parse(endDate);
					Date prd = dt.parse(temp.substring(11));
					Date ned = dt.parse(att.getAttendanceDate().substring(11));
					//  将本天的上下班签到时间和正常的时间做对比
					if (prd.getTime()<=sd.getTime() && ned.getTime()>=ed.getTime()) {
						counts++;
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//  截取年月日并赋值给第三方变量，代表上个遍历的数据
			temp = att.getAttendanceDate();
		}
		return counts;
	}
	//  计算相差天数
	 public int daysBetween(String smdate,String bdate) throws ParseException{  
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
	        Calendar cal = Calendar.getInstance();    
	        cal.setTime(sdf.parse(smdate));    
	        long time1 = cal.getTimeInMillis();                 
	        cal.setTime(sdf.parse(bdate));    
	        long time2 = cal.getTimeInMillis();         
	        long between_days=(time2-time1)/(1000*3600*24);  
	            
	       return Integer.parseInt(String.valueOf(between_days));     
	    }  
}