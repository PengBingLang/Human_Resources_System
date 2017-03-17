package employee;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.EmployeeLogin;
import net.sf.json.JSONArray;

public class AdviceServlet extends HttpServlet {

	private EmployeeService service = new EmployeeService();

	public AdviceServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	/**
	 * 查询有效的通知
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List list = service.getAdvice();
		request.setAttribute("adviceInfo", list);
		// 通过转发跳转到显示页面
		request.getRequestDispatcher("/advice.jsp").forward(request, response);
	}

	/**
	 * 查询全部历史通知
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List list = service.getAdviceAll();
		// 将java里的List类型转换为js的数组类型
		JSONArray js = JSONArray.fromObject(list);
		response.getWriter().print(js);
	}

	public void init() throws ServletException {
		// Put your code here
	}
}
