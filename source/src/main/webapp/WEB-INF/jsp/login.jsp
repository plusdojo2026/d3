<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
<title>Brew List</title>
 <link rel="stylesheet" 
 	href="${pageContext.request.contextPath}/css/login.css">
 	
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

/*
.menu {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding-top: 30px;
}*/
  .error-message {
    color: #dc3545;
    font-size: 12px;
    margin-top: 5px;
    display: none;
    position:relative;
    text-align:center;
    z-index:20; 
  }

  .error-message.show {
  display: block;
  }
 </style>
</head>

<body>

	<div class="title-area">Brew List</div>
	
<header class="header">
 
	<a href="HomeServlet"><img src="images/ikon.png"  width="35"></a>

     <a href="FavoriteServlet"><img src="images/fav.png"  width="50"></a>
    
    <a href="MypageServlet"><img src="images/mypage.png"  width="50" ></a>

</header>

<div class="fade-up">
<h1 class= tag>ログイン</h1>
<form method="POST" action="/d3/LoginServlet" id="loginForm">
		
		<input type="email" id="email" name="email" class="form" placeholder="メールアドレス"></input><br>
		<div class ="error-message" id="emailError">メールアドレスを入力してください</div>
		<input type="password" id="password" name="password" class="form" placeholder="パスワード"><br>
		<div class ="error-message" id="passwordError">パスワードを入力してください</div>
		<button type="submit" class="button">ログイン</button><br>
		
		</form>
<div class="registlink">
<a href="/d3/RegistServlet">
新規登録はこちら
</a>
</div>


<div class ="image-kemuri">
	<img src="images/kemuri.png"class="login-img2" alt="">
</div>
</div>

<div class ="image-box">
	<img src="images/hot.png"class="login-img" alt="">
</div>
<script>
	const form = document.getElementById('loginForm');
	const emailInput = document.getElementById('email');
	const passwordInput = document.getElementById('password');
	
	//エラーメッセージ要素の取得
	const emailError = document.getElementById('emailError');
	const passwordError = document.getElementById('passwordError');
	
	//バリデーション関数（必須入力や形式の確認のため）
	function validateForm() {
		let isValid = true;
	
		//メールアドレスのバリデーション
		const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (emailInput.value.trim() === '') {
      emailInput.classList.add('error');
      emailError.textContent = 'メールアドレスを入力してください';
      emailError.classList.add('show');
      isValid = false;
	}else if (emailInput.value.length < 8 || emailInput.value.length > 50) {
    	emailInput.classList.add('error');
    	emailError.textContent = 'メールアドレスは8~50文字でで入力してください';
    	emailError.classList.add('show');
        isValid = false;
    } else if (!emailRegex.test(emailInput.value.trim())) {
      emailInput.classList.add('error');
      emailError.textContent = '有効なメールアドレスを入力してください';
      emailError.classList.add('show');
      isValid = false;
    } else {
      emailInput.classList.remove('error');
      emailError.classList.remove('show');
    }
		
		// パスワードのバリデーション
	    if (passwordInput.value === '') {
	      passwordInput.classList.add('error');
	      passwordError.classList.add('show');
	      isValid = false;
	    } else if (passwordInput.value.length < 8 || passwordInput.value.length > 20) {
	      passwordInput.classList.add('error');
	      passwordError.textContent = 'パスワードは8-20文字で入力してください';
	      passwordError.classList.add('show');
	      isValid = false;
	    } else {
	      passwordInput.classList.remove('error');
	      passwordError.classList.remove('show');
	    }

	    return isValid;
	  }

	  // フォーム送信時のイベント
	  form.addEventListener('submit', function(e) {
	    e.preventDefault();

	    if (validateForm()) {
	      form.submit();
	    }
	  });

	  // リアルタイムバリデーション
	  emailInput.addEventListener('blur', function() {
	    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	    if (this.value.trim() !== '' && emailRegex.test(this.value.trim()) && this.value.length >= 8 && this.value.length <= 50) {
	      this.classList.remove('error');
	      emailError.classList.remove('show');
	    }
	  });

	  passwordInput.addEventListener('blur', function() {
	    if (this.value.length >= 8 && this.value.length <= 20) {
	      this.classList.remove('error');
	      passwordError.classList.remove('show');
	    }
	  });
</script>
</body>
</html>