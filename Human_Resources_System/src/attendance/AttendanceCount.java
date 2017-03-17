package attendance;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ProjectUtil;
import entity.attendanceCountTab;
import entity.leaveTab;

public class AttendanceCount extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AttendanceCount() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		AttendanceCountService service = new AttendanceCountService();
		/*获取用户输入的查询统计数据*/
		String employeeNumber = request.getParameter("employeeNumber");
		String bgingTime= request.getParameter("bgingtime");
		String endTime = request.getParameter("endtime");
		String totalAttendance = request.getParameter("totalAttendance");
		// 通过工号去统计对应员工的迟到和早退次数
		int countLate = service.QueryCountLate(employeeNumber, bgingTime, endTime);
		int countLackTime = service.QueryCountLackTime(employeeNumber, bgingTime, endTime);
		
		// 查询正常出勤次数
		ProjectUtil pu = new ProjectUtil();
		int countAttendance = pu.getcountAttendance(employeeNumber, bgingTime, endTime);
		
		//  查询请假天数
		int countLeave=0;
		List<leaveTab> list = service.getCountLeave(employeeNumber, bgingTime, endTime);
		for(int i = 0;i < list.size();i++){
			try {
				countLeave = pu.daysBetween(list.get(i).getDateBging(),list.get(i).getDateEnd())+countLeave;
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//  将数据插入到数据库的考勤统计表，并且将表数据查出来显示在页面之上
		/*2017年1月9日22:42:49*/
		// 将数据保存到对象中
		attendanceCountTab att = new attendanceCountTab();
			att.setEmployeeNumber(new Integer(employeeNumber));
			att.setCountBegin(bgingTime);
			att.setCountEnd(endTime);
			att.setCountLate(countLate);
			att.setCountLackTime(countLackTime);
			att.setCountAttendance(countAttendance);
			att.setCountLeave(countLeave);
			att.setTotalAttendance(new Integer(totalAttendance));
		/*boolean rs = service.insertAttendanceCountTab(att);
		System.out.println(rs);*/
		boolean rs=true;
		if(rs){
			response.setCharacterEncoding("UTF-8");
			response.sendRedirect("/Human_Resources_System/gotoIndex.jsp");
		}else{
			response.setCharacterEncoding("UTF-8");
			response.sendRedirect("/Human_Resources_System/attendanceCount.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
