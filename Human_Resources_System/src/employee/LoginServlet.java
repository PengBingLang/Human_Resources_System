package employee;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.MapToEntiy;
import entity.EmployeeLogin;

public class LoginServlet extends HttpServlet {

	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 做登录验证
		EmployeeLogin employeeLogin = (EmployeeLogin) MapToEntiy.convert(
				request.getParameterMap(), EmployeeLogin.class);
		EmployeeService service = new EmployeeService();
		EmployeeLogin result = service.login(employeeLogin);

		if (result != null) {
			// 登陆成功后把用户信息保存到session中
			request.getSession().setAttribute("employeeLogin", result);

			// 根据职称的权限，跳转到个人主页
			if (result.getRankID() == 0) {
				response.sendRedirect("/Human_Resources_System/Frameset.html");
			}else{
				response.sendRedirect("/Human_Resources_System/FramesetMin.html");
			}
		} else {
			response.sendRedirect("/Human_Resources_System/login.html");
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
