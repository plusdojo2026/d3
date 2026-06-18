package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.IdPwDAO;
import dto.IdPw;

@WebServlet("/MypageServlet")//
	public class MypageServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
			
			HttpSession session = request.getSession();
			/*セッションに登録したユーザー情報を保存*/
	        IdPw loginUser =(IdPw) session.getAttribute("id");
	        /*daoを呼び出す*/

	        
	        //必要な処理 
			//userテーブルから取得して8に表示。データ取り出し方と入れ方。
			//6に登録済みの値を初期表示する。
	        
	     // 検索結果をリクエストスコープに格納する
			request.setAttribute("user", loginUser);
			
	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
	dispatcher.forward(request, response);
}
		protected void doGPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
			
			request.setCharacterEncoding("UTF-8");
			int mylevel = Integer.parseInt(request.getParameter("mylevel"));
			IdPwDAO setMyleval = new IdPwDAO();//ここにmylevelを格納して上書き
			if (request.getParameter("submit").equals("更新")) {
				
			}//更新失敗はない
			
			// 結果ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
			dispatcher.forward(request, response);
			//7押下時、
			//未登録なら、６で選択した内容を登録する
			//登録済みなら更新する。
			//アラートで「ユーザー情報を保存しました」
		}
	}
		
