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


@WebServlet("/LoginServlet")
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
		//必要項目の取得：
		request.setCharacterEncoding("UTF-8");		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		//DAOにログイン処理を求める
		IdPwDAO iDao = new IdPwDAO();
		List<IdPw> UserList = iDao.getInfoUser(new IdPw(0, email, "", password, 1));
		
		// 修正：nullチェック と 空リストチェック
		if(UserList == null || UserList.isEmpty()) {
			// ログイン失敗時
			request.setAttribute("errorMessage", "ユーザー名またはパスワードが間違っています");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else {
			// ログイン成功時
			HttpSession session = request.getSession();
			IdPw user = UserList.get(0); // ← 安全になった
			session.setAttribute("id", user);
			//response.sendRedirect("/d3/Home.jsp");
			response.sendRedirect("/d3/HomeServlet");
		}
	}
}
