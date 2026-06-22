<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新規登録｜Brew List</title>

 <link rel="stylesheet" 
 		href="${pageContext.request.contextPath}/css/regist.css">

 <style>
  .header {
  	display:  flex;
  	justify-content: space-evenly;
  	align-items: center;
    height: 80px;

    background-color: #804040;
    border-bottom: 5px solid #b68161;
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

/* エラースタイル */
.error-message {
    color: #d32f2f;
    font-size: 12px;
    margin-top: 5px;
    margin-bottom: 10px;
}

.form.error {
    border: 2px solid #d32f2f !important;
    background-color: #ffebee !important;
}

.form-group {
    margin-bottom: 15px;
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
	
<h1 class="tag">新規登録</h1>

<form method="POST" action="/d3/RegistServlet" id="registForm">
    <div class="middle">
        
        <!-- ユーザー名 -->
        <div class="form-group">
            <input type="text" id="user" name="user" placeholder="ユーザー名" class="form">
            <div id="userError" class="error-message"></div>
        </div>
        
        <!-- メールアドレス -->
        <div class="form-group">
            <input type="email" id="email" name="email" placeholder="メールアドレス" class="form">
            <div id="emailError" class="error-message"></div>
        </div>
        
        <!-- パスワード -->
        <div class="form-group">
            <input type="password" id="password" name="password" placeholder="パスワード" class="form">
            <div id="passwordError" class="error-message"></div>
        </div>

        <input type="submit" value="登録" class="submit-btn">
    </div>
</form>

<div class="fade-up">
	<div class="image-box">
		<img src="images/ice.png" class="login-img" alt="">
	</div>
</div>

</body>

<script>
  // フォーム要素の取得
  const form = document.getElementById('registForm');
  const userInput = document.getElementById('user');
  const emailInput = document.getElementById('email');
  const passwordInput = document.getElementById('password');

  // エラーメッセージ要素の取得
  const userError = document.getElementById('userError');
  const emailError = document.getElementById('emailError');
  const passwordError = document.getElementById('passwordError');

  // バリデーション関数
  function validateForm() {
    let isValid = true;

    // ユーザーネームのバリデーション
    if (userInput.value.trim() === '') {
      userInput.classList.add('error');
      userError.textContent = 'ユーザー名を入力してください';
      isValid = false;
    } else {
      userInput.classList.remove('error');
      userError.textContent = '';
    }

    // メールアドレスのバリデーション
    const emailRegex = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;
    if (emailInput.value.trim() === '') {
      emailInput.classList.add('error');
      emailError.textContent = 'メールアドレスを入力してください';
      isValid = false;
    } else if (!emailRegex.test(emailInput.value.trim())) {
      emailInput.classList.add('error');
      emailError.textContent = '有効なメールアドレスを入力してください';
      isValid = false;
    } else {
      emailInput.classList.remove('error');
      emailError.textContent = '';
    }

    // パスワードのバリデーション
    if (passwordInput.value === '') {
      passwordInput.classList.add('error');
      passwordError.textContent = 'パスワードを入力してください';
      isValid = false;
    } else if (passwordInput.value.length < 6) {
      passwordInput.classList.add('error');
      passwordError.textContent = 'パスワードは6文字以上で入力してください';
      isValid = false;
    } else {
      passwordInput.classList.remove('error');
      passwordError.textContent = '';
    }

    return isValid;
  }

  // フォーム送信時のイベント
  form.addEventListener('submit', function(e) {
    e.preventDefault();

    if (validateForm()) {
      // バリデーション成功時のみ送信
      form.submit();
    }
  });

  // リアルタイムバリデーション（フィールドを離れたとき）
  userInput.addEventListener('blur', function() {
    if (this.value.trim() !== '') {
      this.classList.remove('error');
      userError.textContent = '';
    }
  });

  emailInput.addEventListener('blur', function() {
    const emailRegex = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;
    if (this.value.trim() !== '' && emailRegex.test(this.value.trim())) {
      this.classList.remove('error');
      emailError.textContent = '';
    }
  });

  passwordInput.addEventListener('blur', function() {
    if (this.value.length >= 6) {
      this.classList.remove('error');
      passwordError.textContent = '';
    }
  });
</script>

</html>