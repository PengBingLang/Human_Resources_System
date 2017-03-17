package employee;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCodeServlet extends HttpServlet {

	public CheckCodeServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* 创建图片缓冲区 */
		BufferedImage bi = new BufferedImage(100, 50, BufferedImage.TYPE_INT_RGB);
		/* 获取画笔 */
		Graphics g = bi.getGraphics();
		/* 设置画笔颜色 */
		g.setColor(new Color(220, 220, 220));
		/* 画背景 */
		g.fillRect(0, 0, 100, 50);
		/* 定义内容 */
		char chars[] = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
		/* 创建随机对象 */
		Random random = new Random();
		// 创建高级String对象
		StringBuffer sb = new StringBuffer();

		// 通过循环，随机产生出4位验证码
		for (int i = 0; i < 4; i++) {
			/* 通过随机对象随机获取内容数组中的内容 */
			char ch = chars[random.nextInt(36)];
			// 将产生的验证码字符追加到sb保存起来，用于判断用户是否输入正确
			sb.append(ch);
			/* 通过随机设置画笔颜色 */
			g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
			/* 设置字体 */
			g.setFont(new Font("微软雅黑", Font.ITALIC, 30));
			/* 画内容 */
			g.drawString(ch + "", i * 25, 35);
		}
		// 将产生的验证码添加到request
		request.getSession().setAttribute("checkCode", sb.toString());
		/* 将图片缓冲区的内容以jpg格式写入到响应的输出流中 */
		ImageIO.write(bi, "jpg", response.getOutputStream());
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 判断验证码是否输入正确
		String code = request.getParameter("code");
		if (code.equals(request.getSession().getAttribute("checkCode"))) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
