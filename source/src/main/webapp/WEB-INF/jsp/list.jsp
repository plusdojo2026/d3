<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css">
<title>コーヒー一覧｜Brew List</title>

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
  <a href="HomeServlet"><img src="images/ikonon.png" width="35"></a>
  <a href="FavoriteServlet"><img src="images/fav.png" width="50"></a>
  <a href="MypageServlet"><img src="images/mypage.png" width="50"></a>
</header>

<div class="content">
  <h1 class="tag">コーヒー一覧</h1>

<form action="SearchServlet" method="post">

<input type="text" name="search"
       placeholder="コーヒーを検索"
       value=""  class="searchform">
       
   <div class="selectgroup">
    <select name="sortsize" >
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
	</div>
	
    <button type="submit" id="searchbutton" class="button">検索</button><br>
    
</form>
</div>

	<form action="HomeServlet" method="post">
        <button name="mode" value="recommend" id="recommend" 
        class="bar ${mode == 'recommend' ? 'active' : ''}">おすすめ</button>
        
        <button name="mode" value="history" id="history"
        class="bar ${mode == 'history' ? 'active' : ''}">履歴</button>
	</form>
	
        <script> 
        const recommend = document.getElementById("recommend");
        const history = document.getElementById("history");
        
        recommend.onclick = function() {
            recommend.classList.add("active");
            history.classList.remove("active");
        }

        history.onclick = function() {
            history.classList.add("active");
            recommend.classList.remove("active");
        }
        
    </script>
    

<c:if test="${not empty errorMessage}">
	<script>
    	alert("${errorMessage}");
    </script>
 </c:if>   
 
<c:if test="${empty errorMessage}">

<c:choose>
  <c:when test="${empty coffeeList}">
      <p>該当するコーヒーが見つかりませんでした。</p>
  </c:when>

   <c:otherwise>
   <table class="list">
     <tbody>
      <c:forEach var="coffee" items="${coffeeList}">
      	<tr>
      		<td>
			    <img src="${pageContext.request.contextPath}/cafe_img/${coffee.picture}" 
			    	 class="coffeeimg"
			    	 alt="${coffee.name}">
			</td>
			
			<td>
			  <div class ="coffee-info">
				
				<div class="shopname">${coffee.shopname}</div>
				<div class="name">${coffee.name}</div>
				<div class="size"> ${coffee.size}ml</div>
				<div class="valu">¥${coffee.valu}</div>

					<form action="${pageContext.request.contextPath}/DetailServlet" 
						  method="POST" style="display: inline;">
                    <input type="hidden" name="coffeeId" value="${coffee.number}">
                    <button type="submit" class="detail">詳細</button>
                    </form>
                    
             </div>
            </td>
           </tr>
        </c:forEach>
       </tbody>
      </table>

    </c:otherwise>

</c:choose>
</c:if>
<!-- 改行は%0D%0A -->
<a href="mailto:sekiguchi-tatsuhito-plusdojo2026@seplus2016.onmicrosoft.com?subject=お問い合わせ&body=ユーザー名：%0D%0Aメールアドレス：%0D%0Aお問い合わせ内容：" class="contactbutton" class="linkdesu">お問い合わせ</a>
</body>
</html>