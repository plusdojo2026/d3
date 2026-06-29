package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Coffee;

public class HistoryDAO {
	public boolean insert(int userId, int coffeeNumber) {
		Connection conn = null;
		boolean result = false;
		
		try {
			// JDBCドライバを読み込む
						Class.forName("com.mysql.cj.jdbc.Driver");

						// データベースに接続する
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
								+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
								"d3", "TxVcPESbNwHfpVsY");

						// SQL文を準備する (ベース)
						String sql = "INSERT INTO history "
									+"(userid, number, viewdate)"
									+"VALUES(?,?,NOW())";
						PreparedStatement pStmt =
								conn.prepareStatement(sql);
						
						pStmt.setInt(1,userId);
						pStmt.setInt(2,coffeeNumber);
						
						 result = pStmt.executeUpdate() == 1;
						
		}catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return result;
    }
	
	//重複削除
	public boolean delete(int userId, int coffeeNumber) {
		Connection conn = null;
		boolean result = false;
		
		try {
			// JDBCドライバを読み込む
						Class.forName("com.mysql.cj.jdbc.Driver");

						// データベースに接続する
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
								+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
								"d3", "TxVcPESbNwHfpVsY");

						// SQL文を準備する (ベース)
						String sql = "DELETE FROM history "
									+"WHERE userid = ? "
									+"AND number = ?";
						
						PreparedStatement pStmt =
								conn.prepareStatement(sql);
						
						pStmt.setInt(1,userId);
						pStmt.setInt(2,coffeeNumber);
						
						pStmt.executeUpdate();
						
						result = true;
						
		  } catch(Exception e) {
		        e.printStackTrace();
		    }

		    return result;
		}


	
	public List<Coffee> findHistoryCoffee(int userId) {

		Connection conn = null;
		List<Coffee> coffeeList =
				new ArrayList<Coffee>();

		try {

			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"d3", "TxVcPESbNwHfpVsY");

			// SQL文を準備する (ベース)
			String sql = "SELECT c.* "
						+"FROM history h "
						+"JOIN coffee c "
						+"ON h.number = c.coffeenumber "
						+"WHERE h.userid = ? "
						+"ORDER BY h.viewdate DESC "
						+"LIMIT 5";
			
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1, userId);

			ResultSet rs =
					pStmt.executeQuery();
			
			  while (rs.next()) {
				  
	                Coffee coffee = new Coffee(
	                    rs.getInt("coffeenumber"),
	                    rs.getString("name"),
	                    rs.getInt("valu"),
	                    rs.getInt("size"),
	                    rs.getString("bland"),
	                    rs.getString("area"),
	                    rs.getString("shop"),
	                    rs.getString("shopname"),
	                    rs.getInt("level"),
	                    rs.getString("picture")
	                );
	                coffeeList.add(coffee);
	            }
		}catch (Exception e) {
			        e.printStackTrace();
			    } finally {
			        try {
			            if (conn != null) {
			                conn.close();
			            }
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			    }

			    return coffeeList;
				
	}       
}		
