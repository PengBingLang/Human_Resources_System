package employee;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OffLine extends HttpServlet {

	public OffLine() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	/**
	 * 退出登录，销毁Session
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);// 防止创建Session
		request.getSession().invalidate();// 清除Session中的所有内容
		response.sendRedirect("/Human_Resources_System/login.html");
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
