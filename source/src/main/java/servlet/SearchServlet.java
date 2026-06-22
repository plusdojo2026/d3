package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CoffeeDAO;
import dto.Coffee;

/**
 * Servlet implementation class Search
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
request.setCharacterEncoding("UTF-8");
		
		//入力取得
		String keyword = request.getParameter("search");
		String sortsize = request.getParameter("sortsize");
		String sorttaste = request.getParameter("sorttaste");
		String sortprice = request.getParameter("sortprice");
		
		//-で分割して型変換　サイズ、値段　BETWEEN　ANDで使えるように
		
		int sizeMin = 0;
		int sizeMax = 9999;

		if (sortsize != null && !sortsize.isEmpty()) {
		    String[] s = sortsize.split("-");
		    sizeMin = Integer.parseInt(s[0]);
		    sizeMax = Integer.parseInt(s[1]);
		}
		
		int priceMin = 0;
		int priceMax = 9999;

		if (sortprice != null && !sortprice.isEmpty()) {
		    String[] p = sortprice.split("-");
		    priceMin = Integer.parseInt(p[0]);
		    priceMax = Integer.parseInt(p[1]);
		}
		
		if(keyword != null) {
			keyword = keyword.trim();
		}
		//中身があるかどうか
		boolean hasKeyword = keyword != null && !keyword.isEmpty();
		boolean hasSize = sortsize != null && !sortsize.isEmpty();
		boolean hasTaste = sorttaste != null && !sorttaste.isEmpty();
		boolean hasPrice = sortprice != null && !sortprice.isEmpty();
		
		List<Coffee> coffeeList = null;
		String errorMessage = null;
		
		//条件なし
		if(!hasKeyword && !hasSize && !hasTaste && !hasPrice) {
			errorMessage = "検索欄に最低一文字以上入力してください";
		}else {
			
			Coffee coffee = new Coffee();
			coffee.setKeyword(keyword);
			
			coffee.setSizeMin(sizeMin);
			coffee.setSizeMax(sizeMax);

			coffee.setPriceMin(priceMin);
			coffee.setPriceMax(priceMax);

			if(hasTaste){
			    coffee.setLevel(
			        Integer.parseInt(sorttaste));
			}
            
            CoffeeDAO dao = new CoffeeDAO();
            
            coffeeList = dao.search(coffee);
		}
		
		 	request.setAttribute("coffeeList", coffeeList);   
	        request.setAttribute("errorMessage", errorMessage);

	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
	    	dispatcher.forward(request, response);
	}
	

}
