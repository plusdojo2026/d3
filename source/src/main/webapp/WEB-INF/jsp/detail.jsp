<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!--枠ガイド-->
    <!--<style>
        *{
        outline: 1px solid #ff0000
    }
    </style>-->

<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
 <link rel="stykesheet" href="header.css">
 
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

  <a href="login.jsp" class="login">ログイン</a>

  <div class="menu">
    <a href="home.jsp">ホーム</a>
    <a href="favorite.jsp">お気に入り</a>
    <a href="mypage.jsp">マイページ</a>
  </div>

</header>
</head>

<body>

<!--コーヒー画像-->
<img class="coffeeimg" src="" alt="画像"></img>
<!--お気に入り登録ボタン-->
<button class="favoritebutton">★</button>
<div></div>
<!--公式サイトのリンク-->
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

</body>
</html>