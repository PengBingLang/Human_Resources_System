package admin;

import java.util.List;

import dao.Dao;
import entity.attendanceCountTab;
import entity.attendanceCountView;
import entity.departmentTab;
import entity.employeeInfoTab;
import entity.salaryInfoTab;

public class ReportTabService {
	private Dao dao = new Dao();
	// 职称
	public List reportRankTab( Class clazz) {
		String sql = "select * from rankTab;";
		List list = dao.executeQuery(sql, clazz);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	// 部门
	public List<departmentTab> reportDepartmentTab( Class clazz) {
		String sql = "select * from departmentTab;";
		List list = dao.executeQuery(sql, clazz);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	// 员工
	public List<employeeInfoTab> reportEmployeeInfoTab( Class clazz) {
		String sql = "select employeeNumber,employeePwd,employeeName,employeeID,employeeGender,employeeTel,employeeAddress,DATE_FORMAT(employeeOutTime,'%Y-%m-%d') as employeeOutTime,rankID,departmentID from employeeInfoTab;";
		List list = dao.executeQuery(sql, clazz);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	// 考勤统计
	public List<attendanceCountView> reportAttendanceCountView(
			Class clazz) {
		String sql = "select e.employeeNumber,e.employeeName,d.departmentName,DATE_FORMAT(a.countBegin,'%Y-%m-%d') as countBegin,DATE_FORMAT(a.countEnd,'%Y-%m-%d') as countEnd,a.countLate,a.countLackTime,a.countAttendance,a.countLeave,a.countPaidLeave,a.totalAttendance from attendanceCountTab as a,employeeInfoTab as e,departmentTab as d";
		List list = dao.executeQuery(sql, clazz);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	// 工资表
	public List<salaryInfoTab> reportSalaryInfoTab(
			Class clazz) {
		String sql = "select * from salaryInfoTab;";
		List list = dao.executeQuery(sql, clazz);
		if(list.size()>0){
			return list;
		}else{
			return null;
		}
	}

}
