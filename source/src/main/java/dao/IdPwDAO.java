package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.IdPw;

public class IdPwDAO {
	// 引数で指定されたidpwでログイン成功ならtrueを返す
	public List<IdPw> getInfoUser(IdPw idpw) {//にする。
		Connection conn = null;
		List<IdPw> UserList = new ArrayList<IdPw>();//ここに結果
	

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
					+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
					"d3", "TxVcPESbNwHfpVsY");

			// SELECT文を準備する
			String sql = "SELECT * FROM idpw WHERE email=? AND password=?";//*ではなく、指定して取り出す。
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, idpw.getEmail());
			pStmt.setString(2, idpw.getPassword());

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// メールアドレスとパスワードが一致するユーザーがいれば結果をtrueにする
			//rs.next();
			while (rs.next()) {
				IdPw userInfo = new IdPw(rs.getInt("id")
						, rs.getString("email")
						, rs.getString("user")
						, rs.getString("password")
						, rs.getInt("mylevel")
				);
						
				UserList.add(userInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			UserList = null;
			
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

		// 結果を返す
		return UserList;
		//ここにインサート分
	}
	

	
	//ここから登録のプログラム
		public boolean insert(IdPw UserList) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("com.mysql.cj.jdbc.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/d3?"
						+ "characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true",
						"d3", "TxVcPESbNwHfpVsY");

				// SQL文を準備する
				String sql = "INSERT INTO idpw VALUES (0, ?, ?, ?, ?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				// SQL文を完成させる
				if (UserList.getEmail() != null) {
					pStmt.setString(1, UserList.getEmail());
				} else {
					pStmt.setString(1, "");
				}
				if (UserList.getUser() != null) {
					pStmt.setString(2, UserList.getUser());
				} else {
					pStmt.setString(2, "");
				}
				if (UserList.getPassword() != null) {
					pStmt.setString(3, UserList.getPassword());
				} else {
					pStmt.setString(3, "");
				}
				pStmt.setInt(4, UserList.getMylevel());
			

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					result = true;
				}
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

			// 結果を返す
			return result;
		}
		//ここまで登録プログラム
		
		// 引数cardで指定されたレコードを更新し、成功したらtrueを返す
		public boolean update(int id,int mylevel) {
		    Connection conn = null;
		    boolean result = false;

		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");

		        conn = DriverManager.getConnection(
		            "jdbc:mysql://localhost:3306/d3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9",
		            "d3",
		            "TxVcPESbNwHfpVsY"
		        );

		        // SQL 文の修正：WHERE の前の余分な , を削除
		        String sql = "UPDATE idpw SET mylevel=? WHERE id=?";

		        PreparedStatement pStmt = conn.prepareStatement(sql);

		        // パラメータ設定の修正
		        pStmt.setInt(1, mylevel);      // 1番目：mylevel（INT型）
		        pStmt.setInt(2, id);           // 2番目：id（INT型）

		        if (pStmt.executeUpdate() == 1) {
		            result = true;
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        if (conn != null) {
		            try {
		                conn.close();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    }

		    return result;
		}


}
	
				
		

