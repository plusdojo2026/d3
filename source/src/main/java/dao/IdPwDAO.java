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
					"root", "password");

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
	
	//ここまで登録プログラム
	//ログイン後に対象のレコードを取り出すメソッド、検索条件にemailとパスワードを使う。
	
}


