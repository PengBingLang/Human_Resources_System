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

		// �õ���������Ӧ��
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();// �õ���������ĵ�ַ

		boolean flag = false;

		for (String str : params) {
			if (uri.contains(str)) {
				// ��������а���login�������ʵ��ǵ�¼ҳ�棬������ͨ����
				chain.doFilter(request, response);
				flag = true;
				break;
			}
		}

		if (!flag) {// ���ʵĲ��ǵ�¼ҳ��

			// ��session�л�ȡuserInfo����
			Object obj = req.getSession().getAttribute("userInfo");
			/* ���userInfoΪ��˵��û�е�½������ת����½ҳ��ȥ */
			if (obj == null) {
				res.sendRedirect("login.jsp");
			} else {
				/* ���userInfo��Ϊ�գ������������ִ�� */
				chain.doFilter(request, response);
			}
		}
	}

	private String params[];

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// �ڹ�������ʼ��ʱ����ȡ�����ļ����õ���¼ҳ�������
		params = filterConfig.getInitParameter("chain").split(",");
	}

}