package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CoffeeDAO;
import dto.Coffee;
import dto.IdPw;
import dao.PersonalDAO;

@WebServlet("/DetailServlet")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// コーヒーID を取得
		String coffeeIdStr = request.getParameter("coffeeId");

		if (coffeeIdStr == null || coffeeIdStr.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}

		int coffeeId = Integer.parseInt(coffeeIdStr);

		// ✅ セッションからログインユーザーを取得
		HttpSession session = request.getSession();
		IdPw loginUser = (IdPw) session.getAttribute("id");

		// ✅ 履歴管理：DetailServletの機能を統合
		List<Integer> historyList = (List<Integer>) session.getAttribute("historyList");

		// 初回、nullの場合
		if (historyList == null) {
			historyList = new ArrayList<Integer>();
		}

		// 重複削除（既に履歴にあれば削除）
		historyList.remove(Integer.valueOf(coffeeId));

		// リストの先頭に追加（最新の閲覧を先頭に）
		historyList.add(0, coffeeId);

		// セッションに保存
		session.setAttribute("historyList", historyList);

		// コンソールに表示
		System.out.printf("coffeeNumber:%d%n", coffeeId);

		// ✅ DAO でコーヒー情報を取得
		CoffeeDAO dao = new CoffeeDAO();
		Coffee coffee = dao.getCoffeeById(coffeeId);

		if (coffee == null) {
			response.sendRedirect(request.getContextPath() + "/HomeServlet");
			return;
		}

		// --- DetailServlet.java の doGet メソッド内 ---

		// --- ここから追加 ---
		// ✅ PersonalDAO で保存されたメモを取得
		// --- 72行目付近から修正 ---

		// ✅ PersonalDAO で保存されたメモを取得
		PersonalDAO pDao = new PersonalDAO();
		String savedMemo = ""; // 初期値は空

		if (loginUser != null) {
		    // ログインしている場合、ユーザーIDとコーヒーIDの両方を渡す
		    savedMemo = pDao.getMemo(loginUser.getId(), coffeeId); 
		}

		request.setAttribute("savedMemo", savedMemo); // メモをJSPに渡す
		// --- 修正ここまで ---

		// --- ここまで追加 ---

		// ✅ リクエストスコープに設定
		request.setAttribute("coffee", coffee);
		request.setAttribute("loginUser", loginUser);

		System.out.println("コーヒーID: " + coffeeId);
		System.out.println("コーヒー名: " + coffee.getName());

		// ✅ JSP にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/detail.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
