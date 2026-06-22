package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonalDAO {
    
    private static final String URL = "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true";
    private static final String USER = "root";
    private static final String PASS = "password";
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL ドライバーが見つかりません");
            e.printStackTrace();
        }
    }
    
    /**
     * メモを保存（新規作成または更新）
     */
    public boolean saveMemo(int userId, int coffeeId, String memo) {
        // 指定したユーザーIDとコーヒーIDの組み合わせがあるか確認
        String selectSql = "SELECT personaluserid FROM personal WHERE personaluserid = ? AND personalcoffeeid = ?";
        String insertSql = "INSERT INTO personal (personaluserid, personalcoffeeid, memo) VALUES (?, ?, ?)";
        String updateSql = "UPDATE personal SET memo = ? WHERE personaluserid = ? AND personalcoffeeid = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, userId);
                selectStmt.setInt(2, coffeeId);
                ResultSet rs = selectStmt.executeQuery();
                
                if (rs.next()) {
                    // 存在すれば UPDATE
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setString(1, memo);
                        updateStmt.setInt(2, userId);
                        updateStmt.setInt(3, coffeeId);
                        return updateStmt.executeUpdate() > 0;
                    }
                } else {
                    // 存在しなければ INSERT (personaluserid を明示的に挿入)
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setInt(1, userId);
                        insertStmt.setInt(2, coffeeId);
                        insertStmt.setString(3, memo);
                        return insertStmt.executeUpdate() > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 特定のユーザー・コーヒーのメモを取得
     */
    public String getMemo(int userId, int coffeeId) {
        String sql = "SELECT memo FROM personal WHERE personaluserid = ? AND personalcoffeeid = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setInt(1, userId);
            pStmt.setInt(2, coffeeId);
            ResultSet rs = pStmt.executeQuery();
            
            if (rs.next()) {
                return rs.getString("memo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ""; // データがない場合は空文字を返す
    }

    /**
     * 自分修正価格を更新
     */
    public boolean updatePrice(int userId, int coffeeId, int newPrice) {
        String selectSql = "SELECT personaluserid FROM personal WHERE personaluserid = ? AND personalcoffeeid = ?";
        String insertSql = "INSERT INTO personal (personaluserid, personalcoffeeid, new_valu) VALUES (?, ?, ?)";
        String updateSql = "UPDATE personal SET new_valu = ? WHERE personaluserid = ? AND personalcoffeeid = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS)) {
            try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
                selectStmt.setInt(1, userId);
                selectStmt.setInt(2, coffeeId);
                ResultSet rs = selectStmt.executeQuery();
                
                if (rs.next()) {
                    try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                        updateStmt.setInt(1, newPrice);
                        updateStmt.setInt(2, userId);
                        updateStmt.setInt(3, coffeeId);
                        return updateStmt.executeUpdate() > 0;
                    }
                } else {
                    try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                        insertStmt.setInt(1, userId);
                        insertStmt.setInt(2, coffeeId);
                        insertStmt.setInt(3, newPrice);
                        return insertStmt.executeUpdate() > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}