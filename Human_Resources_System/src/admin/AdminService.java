package admin;

import java.util.List;

import util.SQLFilter;
import dao.Dao;
import entity.attendanceCountView;
import entity.departmentTab;
import entity.employeeInfoTab;
import entity.leaveTab;
import entity.rankTab;

public class AdminService {

	Dao dao = new Dao();

	/**
	 * 添加新通知
	 * 
	 * @param id
	 * @param endTime
	 * @param title
	 * @param infoBody
	 * @return *彭秉浪*
	 */
	public String addAdvice(int id, String endTime, String title,
			String infoBody) {
		String sql = "insert into informTab(employeeNumber,informTime,informValidityEnd,informTitle,informInfo) values(";
		sql += id + ",DATE_FORMAT(now(),'%Y-%m-%d'),'";
		sql += endTime + "','" + title + "','" + infoBody + "')";
		int i = dao.executeUpdate(sql);
		if (i > 0) {
			return "通知发布成功！";
		} else {
			return "发布失败！";
		}
	}

	/**
	 * 添加新的请假信息
	 * 
	 * @param info
	 * @return *彭秉浪*
	 */
	public String addLeave(leaveTab info) {
		String sql = "insert into leaveTab(employeeNumber,dateBging,dateEnd,leaveReason,leaveType) values({employeeNumber},'{dateBging}','{dateEnd}','{leaveReason}','{leaveType}')";
		sql = SQLFilter.filter(sql, info);
		int i = dao.executeUpdate(sql);
		if (i > 0) {
			return "请假添加成功！";
		} else {
			return "请假添加失败！";
		}
	}

	/**
	 * 查询全部请假信息
	 * 
	 * @return *彭秉浪*
	 */
	public List getLeaveAll() {
		String sql = "Select employeeNumber,DATE_FORMAT(dateBging,'%Y-%m-%d') as dateBging,DATE_FORMAT(dateEnd,'%Y-%m-%d') as dateEnd,leaveReason,leaveType from leaveTab";
		List list = dao.executeQuery(sql, leaveTab.class);
		return list;
	}

	/**
	 * 查询全部考勤统计信息
	 * 
	 * @return *彭秉浪*
	 */
	public List getAttendanceAll() {
		String sql = "select e.employeeNumber,e.employeeName,d.departmentName,DATE_FORMAT(a.countBegin,'%Y-%m-%d') as countBegin,DATE_FORMAT(a.countEnd,'%Y-%m-%d') as countEnd,a.countLate,a.countLackTime,a.countAttendance,a.countLeave,a.countPaidLeave,a.totalAttendance from attendanceCountTab as a,employeeInfoTab as e,departmentTab as d where a.employeeNumber=e.employeeNumber and e.departmentID=d.departmentID";
		List list = dao.executeQuery(sql, attendanceCountView.class);
		return list;
	}

	/**
	 * 查询全部员工表信息
	 * 
	 * @return *彭秉浪*
	 */
	public List getEmployeeAll() {
		String sql = "select employeeNumber,employeePwd,employeeName,employeeID,employeeGender,employeeTel,employeeAddress,DATE_FORMAT(employeeOutTime,'%Y-%m-%d') as employeeOutTime,rankID,departmentID from employeeInfoTab";
		List list = dao.executeQuery(sql, employeeInfoTab.class);
		return list;
	}

	/**
	 * 查询全部职称表信息
	 * 
	 * @return *彭秉浪*
	 */
	public List getRankAll() {
		String sql = "select * from rankTab";
		List list = dao.executeQuery(sql, rankTab.class);
		return list;
	}

	/**
	 * 查询全部部门表信息
	 * 
	 * @return *彭秉浪*
	 */
	public List getDepartmentAll() {
		String sql = "select * from departmentTab";
		List list = dao.executeQuery(sql, departmentTab.class);
		return list;
	}

	/**
	 * 修改或新增员工信息
	 * 
	 * @param em
	 * @param type
	 * @return *彭秉浪*
	 */
	public String insertOrUpdate(employeeInfoTab em, String type) {
		String sql = null;
		if (type.equals("0")) {
			sql = "update employeeInfoTab set employeePwd='{employeePwd}',employeeName='{employeeName}',employeeID='{employeeID}',employeeGender='{employeeGender}',employeeTel='{employeeTel}',employeeAddress='{employeeAddress}',employeeOutTime='{employeeOutTime}',rankID={rankID},departmentID={departmentID} where employeeNumber={employeeNumber}";
		} else {
			sql = "insert into employeeInfoTab values({employeeNumber},'{employeePwd}','{employeeName}','{employeeID}','{employeeGender}','{employeeTel}','{employeeAddress}','{employeeOutTime}',{rankID},{departmentID})";
		}
		sql = SQLFilter.filter(sql, em);
		if (dao.executeUpdate(sql) > 0) {
			return "修改或添加成功！";
		} else {
			return "操作失败，请重试！";
		}
	}

	public void getCountLeave(int employeeNumber, String countBegin,String countEnd) {
		
	}
}
