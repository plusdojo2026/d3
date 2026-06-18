package dto;

import java.io.Serializable;

public class IdPw implements Serializable {
    private int id;             //番号
    private String email;      //メールアドレス
    private String user;       //ユーザー名
    private String password;   //パスワード
    private int mylevel;        //コーヒーの濃さ
    
 
	
    public IdPw(int id, String email, String user, String password, int mylevel) {
		super();
		this.id = id;
		this.email = email;
		this.user = user;
		this.password = password;
		this.mylevel = mylevel;
	}//初期化するため
	
	public IdPw(String email,String password) {
		super();
		this.email = email;
		this.password = password;
	}
	
	public IdPw() {
		
	}

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getMylevel() {
		return mylevel;
	}

	public void setMylevel(int mylevel) {
		this.mylevel = mylevel;
	}
	
	
	
}