package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dao.PersonalDAO;
import dto.IdPw;

@WebServlet("/UpdatePriceServlet")
public class UpdatePriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        // セッションからユーザーを取得
        HttpSession session = request.getSession();
        IdPw loginUser = (IdPw) session.getAttribute("id");
        
        if (loginUser == null) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "ログインが必要です");
            response.getWriter().print(errorObj.toString());
            return;
        }
        
        String priceStr = request.getParameter("price");
        String coffeeIdStr = request.getParameter("coffeeId");
        
        if (priceStr == null || coffeeIdStr == null) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "パラメータが不足しています");
            response.getWriter().print(errorObj.toString());
            return;
        }
        
        try {
            int coffeeId = Integer.parseInt(coffeeIdStr);
            int price = Integer.parseInt(priceStr);
            int userId = loginUser.getId();
            
            PersonalDAO dao = new PersonalDAO();
            boolean success = dao.updatePrice(userId, coffeeId, price);
            
            JSONObject resultObj = new JSONObject();
            resultObj.put("success", success);
            resultObj.put("message", success ? "価格を更新しました" : "価格の更新に失敗しました");
            
            response.getWriter().print(resultObj.toString());
            
        } catch (NumberFormatException e) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "不正なパラメータです");
            response.getWriter().print(errorObj.toString());
        }
    }
}
