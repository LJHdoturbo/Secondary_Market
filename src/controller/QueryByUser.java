package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Page;
import service.CommodityService;
import service.CommodityServiceImpl;

/**
 * 查询一个用户的所有出售商品
 * @author 李嘉昊
 * @version 2020年11月23日
 */
@WebServlet("/QueryByUser")
public class QueryByUser extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String currentPage = request.getParameter("currentPage");
		 String otherUserId = request.getParameter("otherUserId");
		 
		 Page p = null;
		 //默认的pageSize为10,构造一个page给服务端
		 final int pageSize = 10;
		 //若第一次查询,则页数为1,否则页数为所获取页数
		 if (currentPage == null)
		 {  
			int i = 1;
			p = new Page(i, pageSize);
		 }
		 else 
		 {
			 p = new Page(Integer.parseInt(currentPage), pageSize);
		 }
		
		 //调用服务层
		 CommodityService service = new CommodityServiceImpl();
		 //重新赋值给p
		 p = service.queryByOwner(otherUserId, p);
		 //对p进行判断
		 if (p.getList() == null)
		 {  
			 request.setAttribute("Message", "没有此人的商品");
			 request.getRequestDispatcher("QueryAllGoods").forward(request, response);
		 }
		 else 
		 {  //记录servlet的地址，方便翻页
			 p.setServletName("QueryByUser?otherUserId"+otherUserId+"&");
			 request.setAttribute("p", p);
			 request.getRequestDispatcher("index.jsp").forward(request, response);
		 }
	}
}


