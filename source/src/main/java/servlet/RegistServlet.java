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
import dto.Result;

@WebServlet("/RegistServlet")//
	public class RegistServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
		 *      response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException
		{
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
	
	if (bDao.insert(new IdPw (0,email,user,password,2))) { // 登録成功
		request.setAttribute("result", new Result("登録成功！", "レコードを登録しました。", "/d3/LoginServlet"));
	} else { // 登録失敗
		request.setAttribute("result", new Result("登録失敗！", "レコードを登録できませんでした。", "/d3/LoginServlet"));
	}
	
	// 結果ページにフォワードする
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher1.forward(request, response);
}
		
	}