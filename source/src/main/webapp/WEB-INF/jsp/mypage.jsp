<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<title>マイページ｜Brew List</title>

<style>
  .header {
    display: flex;
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

  select {
    padding: 8px 12px;
    font-size: 16px;
    border-radius: 5px;
    border: 2px solid #ddd;
  }

  select:focus {
    outline: none;
    border-color: #007bff;
  }

  /* ✅ 成功メッセージのスタイル */
  .success-message {
    background-color: #d4edda;
    border: 1px solid #c3e6cb;
    color: #155724;
    padding: 12px;
    border-radius: 5px;
    margin-bottom: 20px;
    display: none;
  }

  .success-message.show {
    display: block;
  }
  
  /*ログイン*/
.login {
    position: fixed;
    top: 10px;
    right: 20px;
    padding: 8px 16px;
    background: #9c6849;
    color: white;
    border: none;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    z-index: 100;
    
}
.login:hover {
	background: #804040;
}

 a:-webkit-any-link {
	text-decoration: none;
}
  
</style>
</head>

<body>

<div class="title-area">Brew List</div>

  <!-- <a href="/d3/logout.jsp" class="login">ログアウト</a> 
  <a href="/d3/LoginServlet" class="login">ログイン</a>-->
  <c:if test="${empty sessionScope.id}">
  	<a href="/d3/LoginServlet" class="login">ログイン</a>
  </c:if>
  
  <c:if test="${not empty sessionScope.id}">
  	<a href="/d3/logout.jsp" class="login">ログアウト</a>
  </c:if>

<header class="header">
  <a href="HomeServlet"><img src="images/ikon.png" width="35"></a>
  <a href="FavoriteServlet"><img src="images/fav.png" width="50"></a>
  <a href="MypageServlet"><img src="images/mypageon.png" width="50"></a>
</header>

<div class="content">
  <h1 class="tag">マイページ</h1>

  <main>
    <!--  成功メッセージを表示 -->
    <c:if test="${not empty successMessage}">
      <div class="success-message show">
        ✓ ${successMessage}
      </div>
    </c:if>

    <h2 class ="username">${user.user} さん</h2>

    <form action="${pageContext.request.contextPath}/MypageServlet" method="POST">
    	<div class="form-group">

		<label for="kind" class="form-label">
		あなたの好きなコーヒーは？
		</label>

      <!-- JSTL で selected を付加 -->
     <div class ="select-wrapper">
        <select id="level" name="kind" class="selectbox">
          <option value="1" <c:if test="${user.mylevel == 1}">selected</c:if>>あっさり</option>
          <option value="2" <c:if test="${user.mylevel == 2}">selected</c:if>>普通</option>
          <option value="3" <c:if test="${user.mylevel == 3}">selected</c:if>>濃いめ</option>
        </select>
       </div>

      <input type="submit" value="確定" class="button">
		</div>
    </form>
  </main>
</div>

<div class ="image-container">
<div class="image-box">
  <img src="images/hot.png" class="login-img" alt="">
</div>

<div class="image-box2">
  <img src="images/ice.png" class="login-img" alt="">
</div>
</div>

</body>
</html>