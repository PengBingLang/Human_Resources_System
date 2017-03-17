package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.employeeInfoTab;
import net.sf.json.JSONArray;

public class SetEmployee extends HttpServlet {

	private AdminService service = new AdminService();

	public SetEmployee() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	/**
	 * 获取员工全部信息
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List list = new ArrayList();
		list.add(service.getEmployeeAll());
		list.add(service.getRankAll());
		list.add(service.getDepartmentAll());

		// 将java里的List类型转换为js的数组类型
		JSONArray js = JSONArray.fromObject(list);
		response.getWriter().print(js);
	}

	/**
	 * 新增或修改员工信息
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		employeeInfoTab em = new employeeInfoTab();
		String type = request.getParameter("myType");
		em.setEmployeeNumber(Integer.parseInt(request.getParameter("employeeNumber")));
		em.setEmployeePwd(request.getParameter("employeePwd"));
		em.setEmployeeName(request.getParameter("employeeName"));
		em.setEmployeeID(request.getParameter("employeeID"));
		em.setEmployeeGender(request.getParameter("employeeGender"));
		em.setEmployeeTel(request.getParameter("employeeTel"));
		em.setEmployeeAddress(request.getParameter("employeeAddress"));
		em.setEmployeeOutTime(request.getParameter("employeeOutTime"));
		em.setRankID(Integer.parseInt(request.getParameter("rankID")));
		em.setDepartmentID(Integer.parseInt(request.getParameter("departmentID")));
		response.getWriter().print(service.insertOrUpdate(em, type));
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
