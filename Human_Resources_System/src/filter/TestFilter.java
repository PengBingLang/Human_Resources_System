package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		// 拿到请求与响应：
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();// 拿到本次请求的地址

		boolean flag = false;

		for (String str : params) {
			if (uri.contains(str)) {
				// 如果请求中包含login，即访问的是登录页面，就允许通过过
				chain.doFilter(request, response);
				flag = true;
				break;
			}
		}

		if (!flag) {// 访问的不是登录页面

			// 从session中获取userInfo对象
			Object obj = req.getSession().getAttribute("userInfo");
			/* 如果userInfo为空说明没有登陆，就跳转到登陆页面去 */
			if (obj == null) {
				res.sendRedirect("login.jsp");
			} else {
				/* 如果userInfo不为空，就让请求继续执行 */
				chain.doFilter(request, response);
			}
		}
	}

	private String params[];

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 在过滤器初始化时，读取配置文件，拿到登录页面的名字
		params = filterConfig.getInitParameter("chain").split(",");
	}

}
