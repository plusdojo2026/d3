<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>Brew List</title>
 <link rel="stylesheet" 
 	href="${pageContext.request.contextPath}/css/detail.css">
 
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
	
<div class="detail-content">

	<h1 class = tag>詳細</h1>
	
		<!--お気に入り登録ボタン-->
	<button class="favoritebutton">★</button>
	
<div class ="detail">
	<!--コーヒー画像
	<img class="coffeeimg" src="" alt="画像">-->
	<div class ="detail">
	<div class="coffeeimg">画像</div>
	</div>

	<a  class="link" href="公式サイトリンク">公式サイトリンク</a> 
	
	<!--自己修正価格表示欄-->
	<div class="changeprice-label">自分修正価格</div>
	<div class="changeprice">値段表示スペース</div>
	
	<!--コーヒーデータ表示-->
	<div class="card">コーヒーデータ
	    <div class="coffeebrand">ブランド</div>
	    <div class="coffeename">コーヒー名</div>
	    <div class="size">サイズ</div>
	    <div class="price">価格</div>
	</div>
</div>
	
	<!--おすすめフードラベルと表示欄-->
	<div class="recfood-label">おすすめフード</div>
	<div class="recfood">おすすめフード内容表示欄</div>
	<div class="searcharea-label">販売店検索</div>
	<input class="searcharea" placeholder="地域または駅名">
	<button class="sabutton"></button>
	
	<!--メモと値段修正ボックス-->
	<div class="edit-box">
	    <!--メモラベルと記入欄-->
	    <div class="memo-label">自分メモ</div>
	    <input type="memo">
	
	    <!--値段修正ラベルと記入欄-->
	    <div class="cprecord-label">値段修正記録</div>
	    <input class="cprecord">
	    <!--編集ボタンor更新ボタン（切り替わる）-->
	    <button class="editbutton">編集or更新</button>
	</div>
</div>

</body>
</html>