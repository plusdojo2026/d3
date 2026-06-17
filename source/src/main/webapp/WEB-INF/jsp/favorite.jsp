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

<h1 class = "tag">お気に入り</h1>

<!--お気に入り一覧表示エリア-->
<div class="list-area">
    <!--テーブル項目-->
    <div class="card">
        <img class="coffeeimg" src="${e.coffeeimg}" alt="画像">
        <div class="coffeebrand" value="${e.coffeebrand}">ブランド名</div>
        <div class="coffeename" value="${e.coffeename}">コーヒー名</div>
        <div class="coffeesize" value="${e.coffeesize}">サイズ</div>
        <div class="coffeeprice" value="${e.coffeeprice}">価格</div>
        <a href="detail.jsp" class="detail">詳細</a>
    </div>
   </div>
    
</div>
</body>
</html>