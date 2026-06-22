package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FavoriteDAO;
import dto.Coffee;
import dto.IdPw;

@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        IdPw loginUser = (IdPw) session.getAttribute("id");
        
        // ✅ ログイン中かどうかを確認
        if (loginUser == null) {
            // ゲストユーザーの場合、ログイン画面に遷移
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
            return;
        }
        
        // ✅ DAO でログインユーザーのお気に入り一覧を取得
        FavoriteDAO dao = new FavoriteDAO();
        List<Coffee> favoriteList = dao.getFavoriteByUserId(loginUser.getId());
        
        System.out.println("ユーザーID: " + loginUser.getId());
        System.out.println("お気に入り数: " + favoriteList.size());
        
        // ✅ リクエストスコープに設定
        request.setAttribute("favoriteList", favoriteList);
        request.setAttribute("loginUser", loginUser);
        
        // ✅ JSP にフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/favorite.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 文字化け防止
        request.setCharacterEncoding("UTF-8");
        
        // ✅ パラメータを取得
        String coffeeIdStr = request.getParameter("coffeeId");
        String action = request.getParameter("action");
        
        System.out.println("DEBUG: coffeeIdStr = " + coffeeIdStr);
        System.out.println("DEBUG: action = " + action);
        
        // ✅ JSON形式でレスポンスを返す
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // パラメータ検証
            if (coffeeIdStr == null || coffeeIdStr.isEmpty()) {
                out.print("{\"success\": false, \"message\": \"コーヒーIDが指定されていません\"}");
                out.flush();
                return;
            }
            
            int coffeeId = Integer.parseInt(coffeeIdStr);
            
            // ✅ セッションからログインユーザーを取得
            HttpSession session = request.getSession();
            IdPw loginUser = (IdPw) session.getAttribute("id");
            
            if (loginUser == null) {
                out.print("{\"success\": false, \"message\": \"ログインしてください\"}");
                out.flush();
                return;
            }
            
            // ✅ ユーザーIDを取得（intに変換）
            int userId = loginUser.getId();  // ← ここで int に変換
            
            System.out.println("DEBUG: userId = " + userId + ", coffeeId = " + coffeeId);
            
            // ✅ DAO でお気に入りを追加
            FavoriteDAO dao = new FavoriteDAO();
            boolean result = dao.addFavorite(userId, coffeeId);  // ← int, int を渡す
            
            if (result) {
                System.out.println("お気に入り追加成功: ユーザーID=" + userId + ", コーヒーID=" + coffeeId);
                out.print("{\"success\": true, \"message\": \"お気に入りに追加されました\"}");
            } else {
                System.out.println("お気に入り追加失敗: ユーザーID=" + userId + ", コーヒーID=" + coffeeId);
                out.print("{\"success\": false, \"message\": \"お気に入りの追加に失敗しました\"}");
            }
            
        } catch (NumberFormatException e) {
            System.err.println("パラメータが数値ではありません: " + coffeeIdStr);
            out.print("{\"success\": false, \"message\": \"パラメータが不正です\"}");
        } catch (Exception e) {
            System.err.println("エラーが発生しました: " + e.getMessage());
            e.printStackTrace();
            out.print("{\"success\": false, \"message\": \"エラーが発生しました\"}");
        } finally {
            out.flush();
        }
    }

}
