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

@WebServlet("/MypageServlet")
public class MypageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        IdPw loginUser = (IdPw) session.getAttribute("id");
        
        // ✅ リクエストスコープにも設定
        request.setAttribute("user", loginUser);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        IdPw loginUser = (IdPw) session.getAttribute("id");
        
        request.setCharacterEncoding("UTF-8");
        int mylevel = Integer.parseInt(request.getParameter("kind"));
        System.out.println("Level:" + mylevel);
        
        IdPwDAO dao = new IdPwDAO();
        
        if (dao.update(loginUser.getId(), mylevel)) {
            // ✅ ログインユーザーの mylevel を更新
            loginUser.setMylevel(mylevel);
            
            // ✅ セッションに設定（キーは "id"）
            session.setAttribute("id", loginUser);
            
            // ✅ リクエストスコープにも設定
            request.setAttribute("user", loginUser);
            
            // ✅ 成功メッセージをリクエストスコープに設定
            request.setAttribute("successMessage", "ユーザー情報を保存しました");
            
            System.out.println("更新成功。新しいレベル:" + loginUser.getMylevel());
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
            dispatcher.forward(request, response);
        } else {
            // 失敗時：エラーページへ
            System.out.println("更新失敗");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/err_mypage.jsp");
            dispatcher.forward(request, response);
        }
    }
}
