package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.FoodDAO;
import dto.Food;

@WebServlet("/SearchFoodServlet")
public class SearchFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        String levelStr = request.getParameter("level");
        
        if (levelStr == null || levelStr.trim().isEmpty()) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "レベルを指定してください");
            response.getWriter().print(errorObj.toString());
            return;
        }
        
        try {
            int level = Integer.parseInt(levelStr);
            
            FoodDAO dao = new FoodDAO();
            List<Food> foods = dao.getFoodByLevel(level);
            
            JSONArray jsonArray = new JSONArray();
            for (Food food : foods) {
                JSONObject obj = new JSONObject();
                obj.put("foodnumber", food.getFoodnumber());
                obj.put("foodname", food.getFoodname());
                obj.put("foodmemo", food.getFoodmemo());
                obj.put("foodlevel", food.getFoodlevel());
                jsonArray.put(obj);
            }
            
            PrintWriter out = response.getWriter();
            out.print(jsonArray.toString());
            out.flush();
            
        } catch (NumberFormatException e) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "レベルは数値で指定してください");
            response.getWriter().print(errorObj.toString());
        }
    }
}
