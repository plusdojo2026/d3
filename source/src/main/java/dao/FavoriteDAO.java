package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Coffee;

public class FavoriteDAO {
    
    // ✅ ユーザーIDからお気に入りコーヒー一覧を取得
    public List<Coffee> getFavoriteByUserId(int userId) {
        Connection conn = null;
        List<Coffee> favoriteList = new ArrayList<>();
        
        try {
            // JDBCドライバを読み込む
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // データベースに接続
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                "root",
                "password"
            );
            
            // ✅ 3つのテーブルを JOIN して取得
            // coffee テーブルのカラムに合わせて修正
            String sql = "SELECT c.coffeenumber, c.name, c.valu, c.size, c.bland, c.area, "
                    + "c.shop, c.shopname, c.level, c.picture "
                    + "FROM coffee c "
                    + "INNER JOIN likecoffee lc ON c.coffeenumber = lc.coffeenumber "
                    + "INNER JOIN idpw i ON lc.usernumber = i.id "
                    + "WHERE i.id = ? "
                    + "ORDER BY lc.coffeenumber DESC";
            
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, userId);
            
            // SELECT文を実行
            ResultSet rs = pStmt.executeQuery();
            
            // 結果をループして Coffee オブジェクトを作成
            while (rs.next()) {
                Coffee coffee = new Coffee(
                    rs.getInt("coffeenumber"),      // number
                    rs.getString("name"),           // name
                    rs.getInt("valu"),              // valu（価格）
                    rs.getInt("size"),              // size
                    rs.getString("bland"),          // bland（ブランド）
                    rs.getString("area"),           // area（地域）
                    rs.getString("shop"),           // shop
                    rs.getString("shopname"),       // shopname（店舗名）
                    rs.getInt("level"),             // level
                    rs.getString("picture")         // picture（画像）
                );
                favoriteList.add(coffee);
            }
            
            rs.close();
            pStmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            // データベースを切断
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return favoriteList;
    }
    
    // ✅ コーヒーをお気に入りに追加
    public boolean addFavorite(int userId, int coffeeId) {
        Connection conn = null;
        boolean result = false;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                "root",
                "password"
            );
            
            String sql = "INSERT INTO likecoffee (usernumber, coffeenumber) VALUES (?, ?)";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, userId);
            pStmt.setInt(2, coffeeId);
            
            if (pStmt.executeUpdate() == 1) {
                result = true;
            }
            
            pStmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return result;
    }
    
    // ✅ コーヒーをお気に入りから削除
    public boolean removeFavorite(int userId, int coffeeId) {
        Connection conn = null;
        boolean result = false;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
                "root",
                "password"
            );
            
            String sql = "DELETE FROM likecoffee WHERE usernumber = ? AND coffeenumber = ?";
            PreparedStatement pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, userId);
            pStmt.setInt(2, coffeeId);
            
            if (pStmt.executeUpdate() >= 1) {
                result = true;
            }
            
            pStmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return result;
    }
}
