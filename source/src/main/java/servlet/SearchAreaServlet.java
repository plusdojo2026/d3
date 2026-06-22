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

import dao.CoffeeDAO;
import dto.Coffee;

@WebServlet("/SearchAreaServlet")
public class SearchAreaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        String keyword = request.getParameter("keyword");
        
        if (keyword == null || keyword.trim().isEmpty()) {
            JSONObject errorObj = new JSONObject();
            errorObj.put("error", "地域または駅名を入力してください");
            response.getWriter().print(errorObj.toString());
            return;
        }
        
        CoffeeDAO dao = new CoffeeDAO();
        List<Coffee> areas = dao.searchByAreaOrStation(keyword);
        
        JSONArray jsonArray = new JSONArray();
        for (Coffee coffee : areas) {
            JSONObject obj = new JSONObject();
            obj.put("coffeenumber", coffee.getNumber());
            obj.put("area", coffee.getArea());
            obj.put("shopname", coffee.getShopname());
            obj.put("name", coffee.getName());
            obj.put("valu", coffee.getValu());
            jsonArray.put(obj);
        }
        
        PrintWriter out = response.getWriter();
        out.print(jsonArray.toString());
        out.flush();
    }
}

