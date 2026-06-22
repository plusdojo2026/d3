package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Coffee;

public class CoffeeDAO {
    
    private static final String URL = "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true";
    private static final String USER = "root";
    private static final String PASS = "password"; // ⚠️ 自分のパスワードに変更
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL ドライバーが見つかりません");
            e.printStackTrace();
        }
    }
    
    /**
     * コーヒーID で検索
     */
    public Coffee getCoffeeById(int coffeeId) {
        String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture " +
                     "FROM coffee WHERE coffeenumber = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setInt(1, coffeeId);
            ResultSet rs = pStmt.executeQuery();
            
            if (rs.next()) {
                return new Coffee(
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
            }
            
        } catch (SQLException e) {
            System.err.println("getCoffeeById エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    /**
     * 店舗名でコーヒーを検索
     */
    public List<Coffee> searchShopByKeyword(String keyword) {
        List<Coffee> coffees = new ArrayList<>();
        String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture " +
                     "FROM coffee WHERE shopname LIKE ? LIMIT 20";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setString(1, "%" + keyword + "%");
            ResultSet rs = pStmt.executeQuery();
            
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
                coffees.add(coffee);
            }
            
        } catch (SQLException e) {
            System.err.println("searchShopByKeyword エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return coffees;
    }
    
    /**
     * 地域または駅名でコーヒーを検索
     */
    public List<Coffee> searchByAreaOrStation(String keyword) {
        List<Coffee> coffees = new ArrayList<>();
        String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture " +
                     "FROM coffee WHERE area LIKE ? LIMIT 20";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            pStmt.setString(1, "%" + keyword + "%");
            ResultSet rs = pStmt.executeQuery();
            
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
                coffees.add(coffee);
            }
            
        } catch (SQLException e) {
            System.err.println("searchByAreaOrStation エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return coffees;
    }
    
    /**
     * 全てのコーヒーを取得
     */
    public List<Coffee> getAllCoffees() {
        List<Coffee> coffees = new ArrayList<>();
        String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture " +
                     "FROM coffee LIMIT 100";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement pStmt = conn.prepareStatement(sql)) {
            
            ResultSet rs = pStmt.executeQuery();
            
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
                coffees.add(coffee);
            }
            
        } catch (SQLException e) {
            System.err.println("getAllCoffees エラー: " + e.getMessage());
            e.printStackTrace();
        }
        
        return coffees;
    }
    
	public List<Coffee> search(Coffee card) {
		Connection conn = null;
		List<Coffee> cardList = new ArrayList<Coffee>();

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"root", "password");

			// SQL文を準備する (ベース)
			String sql = "SELECT coffeenumber, name, valu,  size, bland, area, shop, shopname, level,  picture " +"FROM coffee WHERE 1=1 ";
		             
			//キーワード検索
			if(card.getKeyword() != null && !card.getKeyword().isEmpty()) {
				sql += " AND(name LIKE ? OR bland LIKE ? OR area LIKE ? OR shop LIKE?) ";
			}
			
			//サイズ　sortsize
			if(card.getSizeMin() >0 && card.getSizeMax() >0) {
				sql += " AND size BETWEEN ? AND ?";
			}
			
			//価格　sortprice
			if (card.getPriceMin() > 0 && card.getPriceMax() > 0) {
	            sql += " AND valu BETWEEN ? AND ? ";
	        }
			
			//風味　sorttaste
			
			if(card.getLevel() >0) {
				sql += " AND level = ?";
			}
			
			sql += " ORDER BY coffeenumber";
					
			// SQL文を完成させる

			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			int i = 1;

			//キーワード
			if(card.getKeyword() != null && !card.getKeyword().isEmpty()) {
				String keyword ="%" + card.getKeyword() + "%";	
				
				pStmt.setString(i++, keyword);
				pStmt.setString(i++, keyword);
				pStmt.setString(i++, keyword);
				pStmt.setString(i++, keyword);
			}
			
			//サイズ
			if(card.getSizeMin() >0 && card.getSizeMax() >0) {
				pStmt.setInt(i++, card.getSizeMin());
				pStmt.setInt(i++, card.getSizeMax());
			}
			
			//価格
			if(card.getPriceMin() >0 && card.getPriceMax() >0) {
				pStmt.setInt(i++, card.getPriceMin());
				pStmt.setInt(i++, card.getPriceMax());
			}
			
			//風味
			if(card.getLevel() >0) {
				pStmt.setInt(i++, card.getLevel());
			}








			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while (rs.next()) {
				Coffee coffee = new Coffee(rs.getInt("coffeenumber"), 
						rs.getString("name"),
						rs.getInt("valu"), 					
						rs.getInt("size"),  
						rs.getString("bland"),
						rs.getString("area"),
						rs.getString("shop"),
						rs.getString("shopname"),
						rs.getInt("level"),		
						rs.getString("picture"));
					
				cardList.add(coffee);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			cardList = null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			cardList = null;
		} finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					cardList = null;
				}
			}
		}

		// 結果を返す
		return cardList;
	}
    
	//ユーザー別おすすめ
		public List<Coffee> findRecommendByUser(int level) {
			Connection conn = null;
			List<Coffee> cardList = new ArrayList<Coffee>();

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"root", "password");

				// SQL文を準備する (ベース)
				String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture "
						+ "FROM coffee "
						+ "WHERE level = ?";
				
				PreparedStatement pStmt = conn.prepareStatement(sql);
				
				pStmt.setInt(1, level);
				
				ResultSet rs = pStmt.executeQuery();
				
				while (rs.next()) {
					Coffee coffee = new Coffee(rs.getInt("coffeenumber"), 
							rs.getString("name"),
							rs.getInt("valu"), 					
							rs.getInt("size"),  
							rs.getString("bland"),
							rs.getString("area"),
							rs.getString("shop"),
							rs.getString("shopname"),
							rs.getInt("level"),		
							rs.getString("picture"));
						
					cardList.add(coffee);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				cardList = null;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				cardList = null;
			} finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
						cardList = null;
					}
				}
			}

			// 結果を返す
			return cardList;
		}
		
		

		//ランダム表示
		public List<Coffee> findRandom() {
			Connection conn = null;
			List<Coffee> cardList = new ArrayList<Coffee>();

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"root", "password");

				// SQL文を準備する (ベース)
				String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture "
						+ "FROM coffee "
						+ "ORDER BY RAND() "
						+ "LIMIT 3";
				
				PreparedStatement pStmt = conn.prepareStatement(sql);
				
				ResultSet rs = pStmt.executeQuery();
				
				while (rs.next()) {
					Coffee coffee = new Coffee(rs.getInt("coffeenumber"), 
							rs.getString("name"),
							rs.getInt("valu"), 					
							rs.getInt("size"),  
							rs.getString("bland"),
							rs.getString("area"),
							rs.getString("shop"),
							rs.getString("shopname"),
							rs.getInt("level"),		
							rs.getString("picture"));
						
					cardList.add(coffee);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				cardList = null;
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				cardList = null;
			} finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
						cardList = null;
					}
				}
			}

			// 結果を返す
			return cardList;
		}
		


		
		//履歴用
		public List<Coffee> findByIds(List<Integer> ids) {
		    
		    List<Coffee> coffeeList = new ArrayList<Coffee>();
		    
		    //空
		    if(ids == null || ids.isEmpty()) {
		        return coffeeList;
		    }
		    
		    Connection conn = null;
		    
		    try {
		        // JDBCドライバを読み込む
		        Class.forName("com.mysql.cj.jdbc.Driver");

		        // データベースに接続する
		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
		                + "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
		                "root", "password");
		    
		        String sql = "SELECT coffeenumber, name, valu, size, bland, area, shop, shopname, level, picture "
		                    + "FROM coffee WHERE coffeenumber IN (";
		        
		        for (int i = 0; i < ids.size(); i++) {
		            sql += "?";
		            
		            if(i < ids.size() - 1) {
		                sql += ",";
		            }
		        }
		    
		        sql += ") ORDER BY FIELD(coffeenumber, ";
		        
		        // FIELD関数用のプレースホルダを追加
		        for (int i = 0; i < ids.size(); i++) {
		            sql += "?";
		            if(i < ids.size() - 1) {
		                sql += ",";
		            }
		        }
		        sql += ")";
		        
		        PreparedStatement pStmt = conn.prepareStatement(sql);

		        // IN句用のパラメータ設定
		        for (int i = 0; i < ids.size(); i++) {
		            pStmt.setInt(i + 1, ids.get(i));
		        }
		        
		        // ORDER BY FIELD用のパラメータ設定
		        for (int i = 0; i < ids.size(); i++) {
		            pStmt.setInt(ids.size() + i + 1, ids.get(i));
		        }

		        ResultSet rs = pStmt.executeQuery();

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
		                rs.getString("picture"));

		            coffeeList.add(coffee);
		        }

		    } catch (Exception e) {
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
