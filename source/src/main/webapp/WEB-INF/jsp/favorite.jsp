<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
 <!--<link rel="stykesheet" href="header.css">-->

 <style>
  .header {
    position:relative;
    height: 80px;
    border-bottom: 1px solid #ddd;
}

.login {
    position: absolute;
    top: 10px;
    right: 20px;
}

.menu {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding-top: 30px;
}
 </style>

<header class="header">

  <a href="LoginServlet" class="login">ログイン</a>

  <div class="menu">
    <a href="HomeServlet">ホーム</a>
    <a href="FavoriteServlet">お気に入り</a>
    <a href="MypageServlet">マイページ</a>
  </div>

</header>
</head>
<body>
<!--お気に入りラベル-->
<div class="favorite-label">お気に入り</div>
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
</body>
</html>