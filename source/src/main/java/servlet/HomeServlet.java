package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoffeeDAO;
import dao.HistoryDAO;
import dto.Coffee;
import dto.IdPw;

@WebServlet("/HomeServlet")//
	public class HomeServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
			/*セッションに登録したユーザー情報を保存*/
			HttpSession session = request.getSession();
	        IdPw loginUser =(IdPw) session.getAttribute("id");
	        /*daoを呼び出す*/
	        CoffeeDAO dao = new CoffeeDAO();
	        
	        List<Coffee> coffeeList;
	        
	        // 初期表示はランダムなおすすめ（DAOから呼び出し）
	        if (loginUser != null) {
	            coffeeList =
	                dao.findRecommendByUser(loginUser.getMylevel());
	        } else {
	            coffeeList = dao.findRandom();
	        }
	        //コーヒー一覧、ログイン情報
	        request.setAttribute("coffeeList", coffeeList);
	        request.setAttribute("id", loginUser);

	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
	dispatcher.forward(request, response);
}
		@Override
	    protected void doPost(HttpServletRequest request,
	                          HttpServletResponse response)
	            throws ServletException, IOException {

			//文字化け防止
	        request.setCharacterEncoding("UTF-8");

	        /*セッションに登録したユーザー情報を取り出し*/
	        HttpSession session = request.getSession();
	        IdPw loginUser =
	            (IdPw) session.getAttribute("id");

	        /*daoを呼び出す*/
	        CoffeeDAO dao = new CoffeeDAO();

	        //切り替え処理用
	        String mode =
	            request.getParameter("mode");

	        //値を受け取る
	        String keyword =
	            request.getParameter("search");

	        String size =
	            request.getParameter("sortsize");

	        String taste =
	            request.getParameter("sorttaste");

	        String price =
	            request.getParameter("sortprice");
	        
	        //入れ物
	        List<Coffee> coffeeList = null;
	        String errorMessage = null;
	        
	        //切り替え処理
	        if("recommend".equals(mode)) {
	        	
	        //ユーザー毎のおすすめ
	        if(loginUser != null) {
	        	coffeeList = dao.findRecommendByUser(loginUser.getMylevel());
	        	
	        }else {
	        //ランダムに表示
	        	coffeeList = dao.findRandom();
	        }
	        //切り替え処理 履歴
		}else if ("history".equals(mode)) {
			
			//未ログイン時
			if(loginUser == null) {
				
			List<Integer>historyList = 
					(List<Integer>) session.getAttribute("historyList");
			
			System.out.println(historyList);
			coffeeList = dao.findByIds(historyList);
			
			}else {
				//ログイン時
				HistoryDAO hDao = new HistoryDAO();

					coffeeList = hDao.findHistoryCoffee(
							loginUser.getId());
			}
		}
	        request.setAttribute("coffeeList", coffeeList);
	        request.setAttribute("id", loginUser);
	        request.setAttribute("errorMessage", errorMessage);

	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/list.jsp");
	    	dispatcher.forward(request, response);
	    }   
	}