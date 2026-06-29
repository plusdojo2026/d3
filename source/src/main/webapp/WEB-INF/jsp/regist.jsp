<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新規登録｜Brew List</title>

<title>新規登録｜Blew List</title>
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

  .error-message {
    color: #dc3545;
    font-size: 12px;
    margin-top: 5px;
    display: none;
  }

  .error-message.show {
    display: block;
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
	
<h1 class = "tag">新規登録</h1>

<div class="middle">
	<form method="POST" action="/d3/RegistServlet" id ="registForm">
	
	<div class ="form-group">
		<label for ="user">ユーザー名<span style="color: #dc3545;">*</span></label><br>
	    <input type="text" id="user" name="user" placeholder="ユーザー名を入力してください" class="form">
	    <div class ="error-message" id="userError">ユーザーネームを入力してください</div>
    </div>
    
	<div class ="form-group">
		<label for ="email">メールアドレス<span style="color: #dc3545;">*</span></label><br>
    	<input type="email" id="email" name="email" placeholder="メールアドレスを入力してください"class="form">
	    <div class ="error-message" id="emailError">有効なメールアドレスを入力してください</div>
    </div>
    
	<div class ="form-group">
	<label for ="password">パスワード<span style="color: #dc3545;">*</span></label><br>
    <input type="password" id="password" name="password" placeholder="パスワードを入力してください"class="form">
	<div class ="error-message" id="passwordError">パスワードを入力してください</div>
    </div>
    
<input type="submit" value="登録" class="button">

	</form> 
</div>

<div class ="fade-up">
	<div class ="image-box">
		<img src="images/ice.png"class="login-img" alt="">
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
      userError.classList.add('show');
      isValid = false;
    } else if (userInput.value.length < 1 || userInput.value.length > 20) {
    	userInput.classList.add('error');
    	userError.textContent = 'ユーザー名は1~20文字で入力してください';
    	userError.classList.add('show');
        isValid = false;
    } else {
      userInput.classList.remove('error');
      userError.classList.remove('show');
    }

    // メールアドレスのバリデーション
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (emailInput.value.trim() === '') {
      emailInput.classList.add('error');
      emailError.textContent = 'メールアドレスを入力してください';
      emailError.classList.add('show');
      isValid = false;
    } else if (emailInput.value.length < 8 || emailInput.value.length > 50) {
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
      passwordError.textContent = 'パスワードは8~20文字で入力してください';
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
  userInput.addEventListener('blur', function() {
    if (this.value.trim() !== ''&&this.value.length >= 1 && this.value.length <= 20) {
      this.classList.remove('error');
      userError.classList.remove('show');
    }
  });

  emailInput.addEventListener('blur', function() {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (this.value.trim() !== '' && emailRegex.test(this.value.trim())&&this.value.length >= 8 && this.value.length <= 50) {
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

</html>
