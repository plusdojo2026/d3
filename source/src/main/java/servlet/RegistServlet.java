package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IdPwDAO;
import dto.IdPw;

@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regist.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String user = request.getParameter("user");
		
		IdPwDAO bDao = new IdPwDAO();
		
		if (bDao.insert(new IdPw(0, email, user, password, 2))) {
			// 登録成功
			request.setAttribute("title", "登録成功！");
			request.setAttribute("message", "レコードを登録しました。");
			request.setAttribute("redirectUrl", "/d3/LoginServlet");
			request.setAttribute("isSuccess", true);
		} else {
			// 登録失敗
			request.setAttribute("title", "登録失敗！");
			request.setAttribute("message", "レコードを登録できませんでした。");
			request.setAttribute("redirectUrl", "/d3/RegistServlet");
			request.setAttribute("isSuccess", false);
			
		}
		
		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/regi_result.jsp");
		dispatcher.forward(request, response);
	}
}
