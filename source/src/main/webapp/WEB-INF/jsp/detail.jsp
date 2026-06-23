<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/detail.css">
<title>コーヒー詳細｜Brew List</title>

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
    transition: all 0.3s;
}
.login:hover {
	background: #804040;
	box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

  .tag {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
  }
</style>

</head>

<body>

	<div class="title-area">Brew List</div>

	<c:choose>
		<c:when test="${not empty loginUser}">
			<form action="${pageContext.request.contextPath}/logout.jsp"
				method="POST" style="display: inline;">
				<button type="submit" class="login-btn">ログアウト</button>
			</form>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/LoginServlet">
				<button type="submit" class="login-btn">ログイン</button>
			</a>
		</c:otherwise>
	</c:choose>

	<header class="header">
		<a href="${pageContext.request.contextPath}/HomeServlet"> <img
			src="${pageContext.request.contextPath}/images/ikon.png" width="35"
			alt="ホーム">
		</a> <a href="${pageContext.request.contextPath}/FavoriteServlet"> <img
			src="${pageContext.request.contextPath}/images/favon.png" width="50"
			alt="お気に入り">
		</a> <a href="${pageContext.request.contextPath}/MypageServlet"> <img
			src="${pageContext.request.contextPath}/images/mypage.png" width="50"
			alt="マイページ">
		</a>
	</header>

<div class="content">
  <h1 class="tag">詳細</h1>
  
			<div class="detail-header">
				<div class="coffee-image">
					<img
						src="${pageContext.request.contextPath}/cafe_img/${coffee.picture}"
						alt="${coffee.name}">
				</div>

				<div class="coffee-info">
					<div>
						<div class="shopname">${coffee.shopname}</div>
						<div class="coffeename">${coffee.name}</div>
					</div>

					<div class="subinfo">
					
						<!-- <div class="info-section">
							<div class="info-label">ブランド</div>
							<div class="info-value">${coffee.bland}</div>
						</div>-->

						<div class="info-section">
							<div class="info-label">サイズ</div>
							<div class="info-value">${coffee.size}ml</div>
						</div>

						<div class="info-section">
							<div class="info-label">地域</div>
							<div class="info-value">${coffee.area}</div>
						</div>

						<div class="price">¥${coffee.valu}
						<!-- もし自分修正価格が記入されているなら、表示 -->
						<c:if test="${not empty personalPrice}">
							自分価格：¥${personalPrice}
						</c:if>
						
						</div>

							<button class="btn-favorite"
								onclick="toggleFavorite(${coffee.number})">
								<img src="images/favon.png" width="30">
							</button>
							
							<a href="${coffee.shop}" target="_blank">公式サイト</a>
							</div>
						</div>
					</div>
				</div>

			<div class="detail-body">
				<div class="section">
					<div class="section-title">コーヒーレベル</div>
					<div class="section-content">
						<c:choose>
							<c:when test="${coffee.level == 1}">あっさり</c:when>
							<c:when test="${coffee.level == 2}">普通</c:when>
							<c:when test="${coffee.level == 3}">濃いめ</c:when>
							<c:otherwise>未設定</c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- <div class="section">
					<div class="section-title">おすすめフード検索</div>
					<div class="search-section">
						<input type="text" id="foodKeyword" class="search-input"
							placeholder="フード名を入力...">
						<button class="search-btn" onclick="searchFood()">検索</button>
					</div>-->
					
					<div class="section">
					<div class="section-title">おすすめフード</div>
					
					<div id="foodResults"  style="display: none;">
						<div id="foodResultsList"></div>
					</div>
				</div>

				<div class="section">
					<div class="section-title">販売店検索</div>
					<div class="search-section">
						<input type="text" id="shopKeyword" class="search-input"
							placeholder="店舗名を入力...">
						<button class="search-btn" onclick="searchShop()">検索</button>
					</div>
					<div id="shopResults" class="search-results" style="display: none;">
						<div id="shopResultsList"></div>
					</div>
				</div>

				<div class="section">
					<div class="section-title">地域または駅名検索</div>
					<div class="search-section">
						<input type="text" id="areaKeyword" class="search-input"
							placeholder="地域名または駅名を入力...">
						<button class="search-btn" onclick="searchArea()">検索</button>
					</div>
					<div id="areaResults" class="search-results" style="display: none;">
						<div id="areaResultsList"></div>
					</div>
				</div>

				<%-- --- detail.jsp の自分メモ セクション --- --%>
				<%-- detail.jsp の自分メモ部分 --%>
				<div class="section">
					<div class="section-title">自分メモ</div>
					<div class="memo-section">
						<textarea id="memoText" class="memo-input"
							placeholder="このコーヒーについてメモを入力してください...">${savedMemo}</textarea>
						<button class="save-btn" onclick="saveMemo()">メモを保存</button>
					</div>
				</div>



				<div class="section">
					<div class="section-title">自分修正価格</div>
					<div class="price-edit-section">
						<input type="number" id="priceInput" class="price-input"
							value="${coffee.valu}" placeholder="価格を入力">
						<button class="edit-btn" onclick="updatePrice()">価格を更新</button>
					</div>
				</div>

				<a href="javascript:history.back()" class="back-btn">戻る</a>
			</div>

	<script>
	//ロード時にお気に入りフード呼び出し
	window.onload = function(){
		  searchFood();
	  };
	
  // ✅ お気に入り追加/削除
  function toggleFavorite(coffeeId) {
    console.log('=== toggleFavorite 開始 ===');
    console.log('coffeeId:', coffeeId);
    console.log('typeof coffeeId:', typeof coffeeId);
    
    if (coffeeId === '' || coffeeId === 'undefined' || coffeeId === undefined) {
      alert('コーヒーIDが取得できません');
      console.log('❌ coffeeIdが無効');
      return;
    }

    const url = '${pageContext.request.contextPath}/FavoriteServlet';
    const body = 'coffeeId=' + encodeURIComponent(coffeeId) + '&action=add';
    
    console.log('URL:', url);
    console.log('Body:', body);

    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body
    })
    .then(response => {
      console.log('Response status:', response.status);
      console.log('Response type:', response.type);
      return response.json();
    })
    .then(data => {
      console.log('✅ レスポンス受信:', data);
      if (data.success) {
        alert(data.message);
        const btn = document.querySelector('.btn-favorite');
        const text = document.getElementById('favoriteText');
        btn.classList.add('added');
        text.textContent = '♥ お気に入りに追加済み';
      } else {
        alert('❌ ' + (data.message || 'エラーが発生しました'));
      }
    })
    .catch(error => {
      console.error('❌ Fetchエラー:', error);
      alert('お気に入りの追加に失敗しました');
    });
  }

  // ✅ おすすめフード検索
  function searchFood() {
    const coffeeLevel = '${coffee.level}';
    
    if (coffeeLevel === '' || coffeeLevel === 'undefined') {
      alert('コーヒーレベルが取得できません');
      return;
    }

    fetch('${pageContext.request.contextPath}/SearchFoodServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'level=' + encodeURIComponent(coffeeLevel)
    })
    .then(response => response.json())
    .then(data => {
      console.log('フード検索結果:', data);
      displayFoodResults(data);
    })
    .catch(error => {
      console.error('Error:', error);
      alert('検索中にエラーが発生しました');
    });
  }

  function displayFoodResults(data) {
    const resultsDiv = document.getElementById('foodResults');
    const resultsList = document.getElementById('foodResultsList');
    
    if (!data || data.length === 0) {
      resultsList.innerHTML = '<div class="no-results">検索結果が見つかりませんでした。</div>';
    } else {
      resultsList.innerHTML = data.map(item => 
        '<div class="result-item">' +
        '<div class="result-title">' + (item.foodname || '名前なし') + '</div>' +
        '<div class="result-desc">' + (item.foodmemo || 'メモなし') + '</div>' +
        '</div>'
      ).join('');
    }
    
    resultsDiv.style.display = 'block';
  }

  // ✅ 販売店検索
  function searchShop() {
    const keyword = document.getElementById('shopKeyword').value.trim();
    
    if (keyword === '') {
      alert('店舗名を入力してください');
      return;
    }

    fetch('${pageContext.request.contextPath}/SearchShopServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'keyword=' + encodeURIComponent(keyword)
    })
    .then(response => response.json())
    .then(data => {
      console.log('店舗検索結果:', data);
      displayShopResults(data);
    })
    .catch(error => {
      console.error('Error:', error);
      alert('検索中にエラーが発生しました');
    });
  }

  function displayShopResults(data) {
    const resultsDiv = document.getElementById('shopResults');
    const resultsList = document.getElementById('shopResultsList');
    
    if (!data || data.length === 0) {
      resultsList.innerHTML = '<div class="no-results">検索結果が見つかりませんでした。</div>';
    } else {
      resultsList.innerHTML = data.map(item => 
        '<div class="result-item">' +
        '<div class="result-title">' + (item.shopname || '名前なし') + '</div>' +
        '<div class="result-desc">地域: ' + (item.area || '不明') + ' | 価格: ¥' + (item.valu || '不明') + '</div>' +
        '</div>'
      ).join('');
    }
    
    resultsDiv.style.display = 'block';
  }

  // ✅ 地域または駅名検索
  function searchArea() {
    const keyword = document.getElementById('areaKeyword').value.trim();
    
    if (keyword === '') {
      alert('地域名または駅名を入力してください');
      return;
    }

    fetch('${pageContext.request.contextPath}/SearchAreaServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'keyword=' + encodeURIComponent(keyword)
    })
    .then(response => response.json())
    .then(data => {
      console.log('地域検索結果:', data);
      displayAreaResults(data);
    })
    .catch(error => {
      console.error('Error:', error);
      alert('検索中にエラーが発生しました');
    });
  }

  function displayAreaResults(data) {
    const resultsDiv = document.getElementById('areaResults');
    const resultsList = document.getElementById('areaResultsList');
    
    if (!data || data.length === 0) {
      resultsList.innerHTML = '<div class="no-results">検索結果が見つかりませんでした。</div>';
    } else {
      resultsList.innerHTML = data.map(item => 
        '<div class="result-item">' +
        '<div class="result-title">' + (item.shopname || '名前なし') + '</div>' +
        '<div class="result-desc">地域: ' + (item.area || '不明') + ' | 価格: ¥' + (item.valu || '不明') + '</div>' +
        '</div>'
      ).join('');
    }
    
    resultsDiv.style.display = 'block';
  }

  // ✅ メモを保存
  function saveMemo() {
    const memo = document.getElementById('memoText').value;
    const coffeeId = '${coffee.number}';
    
    console.log('DEBUG: coffeeId =', coffeeId);
    console.log('DEBUG: memo =', memo);
    
    if (coffeeId === '' || coffeeId === 'undefined') {
      alert('コーヒーIDが取得できません');
      return;
    }
    
    if (memo.trim() === '') {
      alert('メモを入力してください');
      return;
    }

    fetch('${pageContext.request.contextPath}/SaveMemoServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'memo=' + encodeURIComponent(memo) + '&coffeeId=' + coffeeId
    })
    .then(response => response.json())
    .then(data => {
      console.log('DEBUG: レスポンス =', data);
      if (data.success) {
        alert(data.message);
      } else {
        alert(data.message || 'ログインしてください');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('メモの保存に失敗しました');
    });
  }

  // ✅ 価格を更新
  function updatePrice() {
    const price = document.getElementById('priceInput').value;
    const coffeeId = '${coffee.number}';
    
    console.log('DEBUG: coffeeId =', coffeeId);
    console.log('DEBUG: price =', price);
    
    if (coffeeId === '' || coffeeId === 'undefined') {
      alert('コーヒーIDが取得できません');
      return;
    }
    
    if (price === '' || isNaN(price)) {
      alert('正しい価格を入力してください');
      return;
    }

    fetch('${pageContext.request.contextPath}/UpdatePriceServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'price=' + encodeURIComponent(price) + '&coffeeId=' + coffeeId
    })
    .then(response => response.json())
    .then(data => {
      console.log('DEBUG: レスポンス =', data);
      if (data.success) {
        alert(data.message);
        location.reload();　//表示するためにリロード
      } else {
        alert(data.message || 'ログインしてください');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('価格の更新に失敗しました');
    });
  }
</script>

</body>
</html>