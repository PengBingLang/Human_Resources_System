package employee;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import entity.EmployeeLogin;

public class AttendanceServlet extends HttpServlet {

	private EmployeeService service = new EmployeeService();

	public AttendanceServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	/**
	 * 查询签到情况
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeLogin employeeLogin = (EmployeeLogin) request.getSession()
				.getAttribute("employeeLogin");
		String type = request.getParameter("type");
		String begin = request.getParameter("begin") + " 00:00:00";
		String end = request.getParameter("end") + " 23:59:59";
		
		if (type.equals("0")) {// 查询上班的
			type = "上班签到";
		} else {// 查询下班的
			type = "下班签到";
		}
		List list = service.getAttendanceInfo(employeeLogin, type, begin, end);
		
		// 将java里的List类型转换为js的数组类型
		JSONArray js = JSONArray.fromObject(list);
		response.getWriter().print(js);
	}

	/**
	 * 处理签到请求
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeLogin employeeLogin = (EmployeeLogin) request.getSession()
				.getAttribute("employeeLogin");
		String type = request.getParameter("type");
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = s.format(new Date());

		boolean b = service.writeAttendance(employeeLogin, type, time);
		String info = "网络或服务器故障，签到失败";
		if (b) {
			info = time + type + "成功！";
		}
		response.getWriter().print(info);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
