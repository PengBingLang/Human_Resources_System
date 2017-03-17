package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.rankTab;

import net.sf.json.JSONArray;

public class SetRankServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SetRankServlet() {
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
		
		request.setCharacterEncoding("utf-8");
		//  拿到操作类型及所有异步提交的数据
		String type = request.getParameter("type");          
		String rankID = request.getParameter("rankID");
		String rankName = request.getParameter("rankName");
		String rankSalary = request.getParameter("rankSalary");
		boolean rs = false; // 记录用户操作结果
		//  判断操作的类型
		if(type.equals("update")){
			try {
				//  数据封装进对象
				rankTab rank = new rankTab();
				rank.setRankID(new Integer(rankID));
				rank.setRankName(rankName);
				rank.setRankSalary(new Double(rankSalary));
				//  将对象传入service进行修改操作
				RankService service = new RankService();
				rs = service.updateRank(rank);
			} catch (NumberFormatException e) {
				
			}finally{
				//  不管是否捕获到数据类型的转换异常都将结果返回
				response.getWriter().print(rs);
			}
			
		}else if(type.equals("insert")){ // 如果type为insert则添加数据
			// 判断用户输入是否为空
			if(rankName.equals("")||rankSalary.equals("")){
				response.getWriter().print(rs);
			}else{	
				try {
					//  数据封装进对象
					rankTab rank = new rankTab();
					rank.setRankName(rankName);
					rank.setRankSalary(new Double(rankSalary));
					// 先将所有的职称表数据查出来
					RankService service = new RankService();
					//  获取到所有职称信息
					List<rankTab> list = service.queryAllRank();
					//  遍历职称信息
					boolean flag = true; // 判断用户插入的值是否在数据库中存在
					int max = 0;
					for(rankTab rk:list){
						//  找到id中的最大值
						if(max<rk.getRankID()){
							max=rk.getRankID();
						}
						if(rank.getRankName().equals(rk.getRankName())){
							flag=false;
						}
					}
					//  让id的最大值加1最为添加数据的id
					rank.setRankID(max+1);
					// 当不在数据库中存在时，可以添加职称信息
					if(flag){
						rs =  service.insertOneRank(rank);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}finally{
					response.getWriter().print(rs);
				}
				
			}
		}
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
		
		//  查询所有职称信息
		String type = request.getParameter("selectType");
		if(type.equals("AllRank")){
			RankService service = new RankService();
			//  获取到所有职称信息
			List list = service.queryAllRank();
			if(list.size()>0){
				// 将java里的List类型转换为js的数组类型,并回传
				JSONArray js = JSONArray.fromObject(list);
				response.getWriter().print(js);
			}else{
				JSONArray js = JSONArray.fromObject(null);
				response.getWriter().print(js);
			}
		}else{
			JSONArray js = JSONArray.fromObject(null);
			response.getWriter().print(js);
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
