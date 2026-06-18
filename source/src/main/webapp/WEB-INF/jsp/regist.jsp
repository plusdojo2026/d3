<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新規登録｜Brew List</title>

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
  }

  .header {
    position: relative;
    height: 80px;
    border-bottom: 1px solid #ddd;
    background-color: white;
  }

  .login {
    position: absolute;
    top: 10px;
    right: 20px;
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
  }

  .login:hover {
    color: #0056b3;
  }

  .menu {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding-top: 30px;
  }

  .menu a {
    text-decoration: none;
    color: #333;
    font-weight: bold;
  }

  .menu a:hover {
    color: #007bff;
  }

  body > h1 {
    text-align: center;
    margin: 30px 0;
    color: #333;
  }

  .form-container {
    max-width: 500px;
    margin: 0 auto;
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }

  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #333;
  }

  .form-group input[type="text"],
  .form-group input[type="email"],
  .form-group input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    transition: border-color 0.3s;
  }

  .form-group input[type="text"]:focus,
  .form-group input[type="email"]:focus,
  .form-group input[type="password"]:focus {
    outline: none;
    border-color: #007bff;
  }

  .form-group input.error {
    border-color: #dc3545;
    background-color: #fff5f5;
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

  .submit-btn {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .submit-btn:hover {
    background-color: #0056b3;
  }

  .submit-btn:active {
    background-color: #004085;
  }

  /* スマホ対応 */
  @media (max-width: 768px) {
    .form-container {
      margin: 20px;
      padding: 20px;
    }

    .menu {
      gap: 15px;
      padding-top: 20px;
    }
  }
</style>

</head>
<body>

<header class="header">
  <a href="${pageContext.request.contextPath}/LoginServlet" class="login">ログイン</a>

  <div class="menu">
    <a href="${pageContext.request.contextPath}/HomeServlet">ホーム</a>
    <a href="${pageContext.request.contextPath}/FavoriteServlet">お気に入り</a>
    <a href="${pageContext.request.contextPath}/MypageServlet">マイページ</a>
  </div>
</header>

<h1>新規登録</h1>

<div class="form-container">
  <form method="POST" action="${pageContext.request.contextPath}/RegistServlet" id="registForm">

    <div class="form-group">
      <label for="user">ユーザーネーム <span style="color: #dc3545;">*</span></label>
      <input type="text" id="user" name="user" placeholder="ユーザーネームを入力してください">
      <div class="error-message" id="userError">ユーザーネームを入力してください</div>
    </div>

    <div class="form-group">
      <label for="email">メールアドレス <span style="color: #dc3545;">*</span></label>
      <input type="email" id="email" name="email" placeholder="メールアドレスを入力してください">
      <div class="error-message" id="emailError">有効なメールアドレスを入力してください</div>
    </div>

    <div class="form-group">
      <label for="password">パスワード <span style="color: #dc3545;">*</span></label>
      <input type="password" id="password" name="password" placeholder="パスワードを入力してください">
      <div class="error-message" id="passwordError">パスワードを入力してください（6文字以上）</div>
    </div>

    <button type="submit" class="submit-btn">登録</button>

  </form>
</div>

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
    } else if (passwordInput.value.length < 6) {
      passwordInput.classList.add('error');
      passwordError.textContent = 'パスワードは6文字以上で入力してください';
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
    if (this.value.trim() !== '') {
      this.classList.remove('error');
      userError.classList.remove('show');
    }
  });

  emailInput.addEventListener('blur', function() {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (this.value.trim() !== '' && emailRegex.test(this.value.trim())) {
      this.classList.remove('error');
      emailError.classList.remove('show');
    }
  });

  passwordInput.addEventListener('blur', function() {
    if (this.value.length >= 6) {
      this.classList.remove('error');
      passwordError.classList.remove('show');
    }
  });
</script>

</body>
</html>
