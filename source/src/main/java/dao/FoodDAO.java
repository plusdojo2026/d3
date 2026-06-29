package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Food;

public class FoodDAO {
    
    // DB接続情報（定数化）
    private static final String URL = "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true";
    private static final String USER = "d3";
    private static final String PASS = "TxVcPESbNwHfpVsY"; // ⚠️ 自分のパスワードに変更
    
    // ✅ ドライバー読み込みは1回だけ
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL ドライバーが見つかりません");
            e.printStackTrace();
        }
    }
    
    /**
     * キーワードでフードを検索
     */
    public List<Food> searchFoodByKeyword(String keyword) {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT foodnumber, foodlevel, foodname, foodmemo FROM food WHERE foodname LIKE ? LIMIT 10";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setString(1, "%" + keyword + "%");
            ResultSet rs = pStmt.executeQuery();
            
            while (rs.next()) {
                Food food = new Food(
                    rs.getInt("foodnumber"),
                    rs.getInt("foodlevel"),
                    rs.getString("foodname"),
                    rs.getString("foodmemo")
                );
                foods.add(food);
            }
            rs.close();
            
        } catch (SQLException e) {
            System.err.println("searchFoodByKeyword エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return foods;
    }
    
    /**
     * レベルでフードを検索
     */
    public List<Food> searchFoodByLevel(int level) {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT foodnumber, foodlevel, foodname, foodmemo FROM food WHERE foodlevel = ? LIMIT 10";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setInt(1, level);
            ResultSet rs = pStmt.executeQuery();
            
            while (rs.next()) {
                Food food = new Food(
                    rs.getInt("foodnumber"),
                    rs.getInt("foodlevel"),
                    rs.getString("foodname"),
                    rs.getString("foodmemo")
                );
                foods.add(food);
            }
            rs.close();
            
        } catch (SQLException e) {
            System.err.println("searchFoodByLevel エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return foods;
    }
    
    /**
     * foodlevel に基づいてフードを検索（SearchFoodServlet で使用）
     * @param level コーヒーのレベル（1:あっさり, 2:普通, 3:濃いめ）
     * @return Food オブジェクトのリスト
     */
    public List<Food> getFoodByLevel(int level) {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT foodnumber, foodlevel, foodname, foodmemo FROM food WHERE foodlevel = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setInt(1, level);
            ResultSet rs = pStmt.executeQuery();
            
            while (rs.next()) {
                int foodnumber = rs.getInt("foodnumber");
                int foodlevel = rs.getInt("foodlevel");
                String foodname = rs.getString("foodname");
                String foodmemo = rs.getString("foodmemo");
                
                Food food = new Food(foodnumber, foodlevel, foodname, foodmemo);
                foods.add(food);
            }
            rs.close();
            
        } catch (SQLException e) {
            System.err.println("getFoodByLevel エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return foods;
    }
    
    /**
     * すべてのフードを取得
     */
    public List<Food> getAllFoods() {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT foodnumber, foodlevel, foodname, foodmemo FROM food";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = pStmt.executeQuery();
            
            while (rs.next()) {
                Food food = new Food(
                    rs.getInt("foodnumber"),
                    rs.getInt("foodlevel"),
                    rs.getString("foodname"),
                    rs.getString("foodmemo")
                );
                foods.add(food);
            }
            rs.close();
            
        } catch (SQLException e) {
            System.err.println("getAllFoods エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return foods;
    }
}
