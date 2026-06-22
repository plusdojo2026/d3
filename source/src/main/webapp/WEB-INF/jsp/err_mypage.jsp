<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>エラー｜Brew List</title>

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
  }

  .error-container {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    padding: 40px;
    max-width: 500px;
    text-align: center;
  }

  .error-icon {
    font-size: 80px;
    color: #dc3545;
    margin-bottom: 20px;
  }

  h1 {
    font-size: 32px;
    color: #dc3545;
    margin-bottom: 15px;
  }

  .error-message {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
    line-height: 1.8;
  }

  .error-details {
    background-color: #fff5f5;
    border-left: 4px solid #dc3545;
    padding: 15px;
    margin-bottom: 30px;
    text-align: left;
    border-radius: 5px;
  }

  .error-details p {
    color: #666;
    font-size: 14px;
    margin: 5px 0;
  }

  .button-group {
    display: flex;
    gap: 10px;
    justify-content: center;
  }

  a, button {
    padding: 12px 30px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: background-color 0.3s;
    display: inline-block;
  }

  .btn-primary {
    background-color: #007bff;
    color: white;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }

  .btn-secondary {
    background-color: #6c757d;
    color: white;
  }

  .btn-secondary:hover {
    background-color: #5a6268;
  }

  .btn-home {
    background-color: #28a745;
    color: white;
  }

  .btn-home:hover {
    background-color: #218838;
  }

  /* スマホ対応 */
  @media (max-width: 768px) {
    .error-container {
      padding: 25px;
    }

    h1 {
      font-size: 28px;
    }

    .error-icon {
      font-size: 60px;
    }

    .error-message {
      font-size: 14px;
    }

    .button-group {
      flex-direction: column;
    }

    a, button {
      width: 100%;
    }
  }
</style>

</head>

<body>

<div class="error-container">
  <div class="error-icon">⚠️</div>

  <h1>エラーが発生しました</h1>

  <div class="error-message">
    申し訳ございません。<br>
    ユーザー情報の更新に失敗しました。
  </div>

  <div class="error-details">
    <p><strong>エラー内容：</strong></p>
    <p>• データベースの更新処理でエラーが発生しました</p>
    <p>• もう一度お試しください</p>
    <p>• 問題が解決しない場合は、管理者にお問い合わせください</p>
  </div>

  <div class="button-group">
    <a href="${pageContext.request.contextPath}/MypageServlet" class="btn-primary">
      マイページに戻る
    </a>
    <a href="${pageContext.request.contextPath}/HomeServlet" class="btn-secondary">
      ホームに戻る
    </a>
  </div>
</div>

</body>
</html>
