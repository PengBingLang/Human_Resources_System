package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.EmployeeLogin;

public class AddAdvice extends HttpServlet {

	public AddAdvice() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * 添加新的通知
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		EmployeeLogin em = (EmployeeLogin) request.getSession().getAttribute("employeeLogin");
		int id = em.getEmployeeNumber();
		String endTime = request.getParameter("endTime");
		String title = request.getParameter("title");
		String infoBody = request.getParameter("infoBody");
		AdminService service = new AdminService();
		response.getWriter().println(service.addAdvice(id, endTime, title, infoBody));
	}

	public void init() throws ServletException {
		// Put your code here
	}
}
