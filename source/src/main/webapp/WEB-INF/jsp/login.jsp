<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>Brew List</title>
 <link rel="stylesheet" 
 	href="${pageContext.request.contextPath}/css/login.css">
 	
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

/*
.menu {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding-top: 30px;
}*/
 </style>
</head>

<body>

	<div class="title-area">Brew List</div>
	
<header class="header">
 
	<a href="HomeServlet"><img src="images/ikon.png"  width="35"></a>

     <a href="FavoriteServlet"><img src="images/fav.png"  width="50"></a>
    
    <a href="MypageServlet"><img src="images/mypage.png"  width="50" ></a>

</header>

<div class="fade-up">
<h1 class= tag>ログイン</h1>


<input type="email" class="form" placeholder="メールアドレス"></input><br>
<input type="password" class="form" placeholder="パスワード"><br>


<button type="submit" class="button">ログイン</button><br>

<div class="registlink">
<a href="${pageContext.request.contextPath}/RegistServlet">
新規登録はこちら
</a>
</div>


<div class ="image-kemuri">
	<img src="images/kemuri.png"class="login-img2" alt="">
</div>
</div>

<div class ="image-box">
	<img src="images/hot.png"class="login-img" alt="">
</div>

</body>
</html>