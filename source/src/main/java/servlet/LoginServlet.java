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

import dao.IdPwDAO;
import dto.IdPw;


@WebServlet("/LoginServlet")//
	public class LoginServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// ログインページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{ 
		//必要項目：取得、DAOにログイン処理を求める、メモサーブレットへリダイレクト p.270を参考
		//必要項目の取得：
		request.setCharacterEncoding("UTF-8");
		
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		
		
	
		//DAOにログイン処理を求める 名刺管理を参考
		IdPwDAO iDao = new IdPwDAO();//DAOクラスのインスタンスを生成
		List<IdPw> UserList = iDao.getInfoUser(new IdPw(0,email,"",password,1)) ; //isLoginOKはDAOの
			//ログイン成功時
			//セッションスコープにIDを格納→これでログイン状態を確認してる？
			//List<IdPw> UserList = bDao.select(new Idpw(0,email,user,password,mylevel));
			
		
		HttpSession session = request.getSession();

		IdPw user = UserList.get(0); // ← リストから最初の IdPw を取得
		session.setAttribute("id", user);// ← 修正[13:22]これでいけるはず
		//session.setAttribute("UserList", UserList);
		//メインサーブレットへリダイレクト
		response.sendRedirect("/d3/HomeServlet");
		
		

	
	
}
	}