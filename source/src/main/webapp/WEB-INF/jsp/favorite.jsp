<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
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

  .login {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
  }

  .login:hover {
    background-color: #0056b3;
  }

  .content {
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
  }

  .tag {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
  }

  .list {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  .list tr {
    border-bottom: 1px solid #ddd;
  }

  .list tr:hover {
    background-color: #f9f9f9;
  }

  .list thead tr {
    background-color: #f5f5f5;
  }

  .list th {
    text-align: left;
    padding: 15px;
    font-weight: bold;
    color: #333;
  }

  .list td {
    padding: 15px;
    vertical-align: middle;
  }

  .coffeeimg {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  .coffee-info {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .shopname {
    font-size: 16px;
    font-weight: bold;
    color: #333;
  }

  .name {
    font-size: 14px;
    color: #666;
  }

  .size {
    font-size: 13px;
    color: #999;
  }

  .valu {
    font-size: 18px;
    font-weight: bold;
    color: #e6e20a;
    margin-top: 5px;
  }

  .detail {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 16px;
    background-color: #28a745;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .detail:hover {
    background-color: #218838;
  }

  .empty-message {
    text-align: center;
    padding: 60px 20px;
    color: #999;
    font-size: 16px;
  }

  .empty-message a {
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
  }

  .empty-message a:hover {
    background-color: #0056b3;
  }

  @media (max-width: 768px) {
    .list tr {
      display: block;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
    }

    .list thead {
      display: none;
    }

    .list td {
      display: block;
      padding: 10px 0;
      border: none;
    }

    .coffeeimg {
      width: 100%;
      height: auto;
      margin-bottom: 10px;
    }

    .detail {
      width: 100%;
      text-align: center;
    }
  }
</style>

</head>

<body>

<div class="title-area">Brew List</div>

<c:choose>
  <c:when test="${not empty loginUser}">
    <form action="${pageContext.request.contextPath}/logout.jsp" method="POST" style="display: inline;">
      <button type="submit" class="login">ログアウト</button>
    </form>
  </c:when>
  <c:otherwise>
    <a href="${pageContext.request.contextPath}/LoginServlet">
      <button type="submit" class="login">ログイン</button>
    </a>
  </c:otherwise>
</c:choose>

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
        <thead>
          <tr>
            <th style="width: 150px;">画像</th>
            <th>コーヒー情報</th>
          </tr>
        </thead>
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
