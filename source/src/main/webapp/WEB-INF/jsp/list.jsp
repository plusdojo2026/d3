<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

  <a href="login.jsp" class="login">ログイン</a>

  <div class="menu">
    <a href="HomeServlet">ホーム</a>
    <a href="favorite.jsp">お気に入り</a>
    <a href="mypage.jsp">マイページ</a>
  </div>

</header>
<meta charset="UTF-8">
<title>メイン｜Blew List</title>
</head>
<body>
<div>

<form action="SearchServlet" method="post">

    <input type="text" name="search"
           placeholder="コーヒーを検索"
           value="" />

    <button type="submit" id="searchbutton">検索</button><br>

    <select name="sortsize">
        <option value="">サイズ</option>
        <option value="100-200">100~200ml</option>
    	<option value="200-300">200~300ml</option>
    	<option value="300-400">300~400ml</option>
    	<option value="400-500">400~500ml</option>
    	<option value="500-600">500~600ml</option>
    	<option value="600-700">600~700ml</option>
    	<option value="700-9999">700ml以上</option>
    </select>

    <select name="sorttaste">
        <option value="">風味</option>
        <option value="1">あっさり</option>
        <option value="2">普通</option>
        <option value="3">濃い</option>
    </select>

    <select name="sortprice">
    	<option value="">価格帯</option>
        <option value="100-200">100~200円</option>
    	<option value="300-400">300~400円</option>
    	<option value="400-500">400~500円</option>
    	<option value="500-600">500~600円</option>
   		<option value="600-700">600~700円</option>
    	<option value="700-9999">700円以上</option>
    </select>

</form>
</div>

<div>

    <form action="HomeServlet" method="post">
        <button name="mode" value="recommend" id="recommend">おすすめ</button>
        <button name="mode" value="history">履歴</button>
    </form>

</div>

<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<div class="list">
<c:if test="${empty errorMessage}">
	<c:choose>

    <c:when test="${empty coffeeList}">
        <p>該当するコーヒーが見つかりませんでした。</p>
    </c:when>

    <c:otherwise>

        <c:forEach var="coffee" items="${coffeeList}">
            <div class="card">

                <!-- 画像 -->
                <img src="${coffee.picture}" class="coffeeimg">

                <!-- ブランド -->
                <div class="coffeebrand">
                    ${coffee.bland}
                </div>

                <!-- 名前 -->
                <div class="coffeename">
                    ${coffee.name}
                </div>

                <!-- サイズ -->
                <div class="coffeesize">
                    サイズ：${coffee.size}
                </div>

                <!-- 価格 -->
                <div class="coffeeprice">
                    ¥${coffee.valu}
                </div>

                <!-- 詳細 -->
                <a href="detail?id=${coffee.number}" class="detail">
                    詳細
                </a>

            </div>
        </c:forEach>

    </c:otherwise>

</c:choose>
</c:if>
</div>
<!-- 改行は%0D%0A -->
<a href="mailto:sekiguchi-tatsuhito-plusdojo2026@seplus2016.onmicrosoft.com?subject=お問い合わせ&body=ユーザー名：%0D%0Aメールアドレス：%0D%0Aお問い合わせ内容：" class="contactbutton">お問い合わせ</a>
</body>
</html>