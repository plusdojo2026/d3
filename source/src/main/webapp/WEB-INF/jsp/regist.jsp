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
<title>新規登録｜Blew List</title>
</head>
<body>
<h1>新規登録</h1>
<div>
    <input type="text" name="username" placeholder="ユーザーネーム">
</div>
<div>
    <input type="email" name="mailaddress" placeholder="メールアドレス">
</div>
<div>
    <input type="password" name="password" placeholder="パスワード">
</div><br>

<input type="submit" value="登録">
</body>
</html>