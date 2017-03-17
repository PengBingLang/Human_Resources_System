package attendance;

import java.util.List;

import util.SQLFilter;

import dao.Dao;
import entity.attendanceCountTab;
import entity.attendanceInfoTab;
import entity.leaveTab;

public class AttendanceCountService {
	private Dao dao = new Dao();
	// 查询工号是否存在
	public boolean checkEmployeeNumber(String employeeNumber) {
		String sql = "select employeeNumber from attendanceinfotab where employeeNumber='" + employeeNumber + "'";
		List list = dao.executeQuery(sql, attendanceInfoTab.class);
		if (list.size() > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	// 查询迟到次数
	public int QueryCountLate(String employeeNumber , String bgingTime , String endTime) {
		int countLate;
		String sql = "select count(*) from human_resources_system.attendanceinfotab where employeeNumber = "+employeeNumber
				+" and (attendanceType = '上班签到')" +
				" and (date_format(attendanceDate,'%H:%i:%s') >'08:00:00')"+
				" and (date_format(attendanceDate,'%Y-%m-%d') between '"+bgingTime+"' and '"+endTime+"');";
		countLate = dao.getCountLine(sql);
		return countLate;
	}
	// 查询早退次数
	public int QueryCountLackTime(String employeeNumber ,String bgingTime,String endTime) {
		int countLackTime=0;
		String sql = "select count(*) from human_resources_system.attendanceinfotab where employeeNumber = "+employeeNumber
				+" and (attendanceType = '下班签到')" +
				" and (date_format(attendanceDate,'%H:%i:%s') <'16:00:00')"+
				" and (date_format(attendanceDate,'%Y-%m-%d') between '"+bgingTime+"' and '"+endTime+"');";
		countLackTime = dao.getCountLine(sql);
		return countLackTime;
	}
	
	//  查询正常出勤的天数，上班签到和下班签到均符合规定则行，先查询全部
	public List getCountAttendance(String employeeNumber,String bgingTime,String endTime ){
		//  date_format将数据库的时间数据类型转换为字符串类型
		String sql = "select date_format(attendanceDate,'%Y-%m-%d %H:%i:%s') attendanceDate , attendanceType from human_resources_system.attendanceinfotab where employeeNumber = "+employeeNumber+
				" and (date_format(attendanceDate,'%Y-%m-%d') between '"+bgingTime+"' and '"+endTime+"');";
		List list = dao.executeQuery(sql, attendanceInfoTab.class);
		/*System.out.println(((attendanceInfoTab) list.get(0)).getAttendanceDate());*/
		return list;
	}
	
	//  查询请假的天数
	public List getCountLeave(String employeeNumber,String bgingTime,String endTime ){
		String sql = "select date_format(datebging,'%Y-%m-%d') dateBging,date_format(dateEnd,'%Y-%m-%d') dateEnd from leaveTab where employeeNumber = "+employeeNumber+
				" and (date_format(dateBging,'%Y-%m-%d') between '"+bgingTime+"' and '"+endTime+"')"+
				" and (date_format(dateEnd,'%Y-%m-%d') between '"+bgingTime+"' and '"+endTime+"');";
		List list = dao.executeQuery(sql, leaveTab.class);
		return list;
	}
	
	//  将统计所得数据插入到对应表中
	public boolean insertAttendanceCountTab(attendanceCountTab act) {
		boolean temp;
		String sql = "insert into attendanceCountTab(employeeNumber,countBegin,countEnd,countLate,countLackTime,countAttendance,countLeave,totalAttendance) values" +
				" ({employeeNumber},'{countBegin}','{countEnd}',{countLate},{countLackTime},{countAttendance},{countLeave},{totalAttendance});";
		sql = SQLFilter.filter(sql, act);
		int rs = dao.executeUpdate(sql);
		if(rs > 0){
			temp = true;
		}else{
			temp = false;
		}
		return temp;
	}
}
