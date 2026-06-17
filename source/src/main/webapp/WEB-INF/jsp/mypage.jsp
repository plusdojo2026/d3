<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>

 <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<title>新規登録｜Blew List</title>

 <style>
  .header {
  	display:  flex;
  	justify-content: space-evenly;
  	align-items: center;
    height: 80px;

    background-color: #e6e20a;
    border-bottom: 3.5px solid #ffffff;
    position: relative;
    z-index: 10;
}
	.header img:hover {
		filter: brightness(1.3);
		transform: scale(1.1);
		}

.menu {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding-top: 30px;
}
 </style>
					
</head>

 <body>
 
 	<div class="title-area">Brew List</div>
 	
	<a href="LoginServlet" >
	<button type="submit" class="login">ログイン</button>
	</a>
	
	<header class="header">
	 
		<a href="HomeServlet"><img src="images/ikon.png"  width="35"></a>
	
	     <a href="FavoriteServlet"><img src="images/fav.png"  width="50"></a>
	    
	    <a href="MypageServlet"><img src="images/mypage.png"  width="50" ></a>
	
	</header>

<div class ="content">
	<h1 class = "tag">マイページ</h1>
	
	  
	 <main>
	 
	 <h2>ユーザー名 さん</h2>
	 
	<!--/*送りたい先のサーブレットを設定*/-->
	 <form action="???????">
	
	<div class ="h3">
	 あなたのコーヒーの好みは？<br>
	</div>
	<label for="level" class="selectbox">
	<select name="kind">
	<option value="1">あっさり</option>
	<option value="2">普通</option>
	<option value="3">濃いめ</option>
	</select>
	</label>
	
	<input type="submit" value="確定"class="button">
	 </form>
	</main>
</div>
 
 	<div class ="image-box">
		<img src="images/ice.png"class="login-img" alt="">
	</div>
	
	<div class ="image-box">
	<img src="images/hot.png"class="login-img" alt="">
	</div>
	
</body>
</html>