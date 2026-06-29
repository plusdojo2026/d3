<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/favorite.css">
<title>お気に入り｜Brew List</title>

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

  .tag {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
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
  	<div class="login"> <a href="/d3/LoginServlet">ログイン</a> </div>
  </c:if>
  
  <c:if test="${not empty sessionScope.id}">
  	<div class="login"> <a href="/d3/logout.jsp" class="login">ログアウト</a> </div>
  </c:if>
  
  
  
<header class="header">
  <a href="${pageContext.request.contextPath}/HomeServlet">
    <img src="${pageContext.request.contextPath}/images/ikon.png" width="35" alt="ホーム">
  </a>

  <a href="${pageContext.request.contextPath}/FavoriteServlet">
    <img src="${pageContext.request.contextPath}/images/favon.png" width="50" alt="お気に入り">
  </a>

  <a href="${pageContext.request.contextPath}/MypageServlet">
    <img src="${pageContext.request.contextPath}/images/mypage.png" width="50" alt="マイページ">
  </a>
</header>

<div class="content">
  <h1 class="tag">お気に入り</h1>

<c:choose>
    <c:when test="${not empty favoriteList && favoriteList.size() > 0}">
      <table class="list">

        <tbody>
          <c:forEach var="coffee" items="${favoriteList}">
            <tr>
              <td>
                <img class="coffeeimg" 
                     src="${pageContext.request.contextPath}/cafe_img/${coffee.picture}" 
                     alt="${coffee.name}">
              </td>

              <td>
                <div class="coffee-info">
                  <div class="shopname">${coffee.shopname}</div>
                  <div class="name">${coffee.name}</div>
                  <div class="size">${coffee.size}ml</div>
                  <div class="valu">¥${coffee.valu}</div>

                  <form action="${pageContext.request.contextPath}/DetailServlet" method="POST" style="display: inline;">
                    <input type="hidden" name="coffeeId" value="${coffee.number}">
                    <button type="submit" class="detail">詳細</button>
                  </form>
                </div>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </c:when>

    <c:otherwise>
      <div class="empty-message">
        <p>お気に入りのコーヒーがまだ登録されていません。</p>
        <a href="${pageContext.request.contextPath}/HomeServlet">ホームに戻る</a>
      </div>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>
