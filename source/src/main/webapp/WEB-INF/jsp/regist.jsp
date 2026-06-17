<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>新規登録｜Blew List</title>
 <link rel="stylesheet" 
 		href="${pageContext.request.contextPath}/css/regist.css">

 <style>
  .header {
  	display:  flex;
  	justify-content: space-evenly;
  	align-items: center;
    height: 80px;

    background-color: #804040;
    border-bottom: 5px solid #b68161;
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
	
<h1 class = "tag">新規登録</h1>
<div class="middle">
    <input type="text" name="username" placeholder="ユーザー名" class="form"><br>
    <input type="email" name="mailaddress" placeholder="メールアドレス"class="form"><br>
    <input type="password" name="password" placeholder="パスワード"class="form"><br>

<input type="submit" value="登録" class="button">
</div>
<div class ="fade-up">
	<div class ="image-box">
		<img src="images/ice.png"class="login-img" alt="">
	</div>
</div>

</body>
</html>