<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>エラー</title>
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
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    padding: 40px;
    max-width: 500px;
    text-align: center;
  }
  
  .error-icon {
    font-size: 60px;
    margin-bottom: 20px;
  }
  
  h1 {
    color: #dc3545;
    font-size: 28px;
    margin-bottom: 15px;
  }
  
  .error-message {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
    line-height: 1.6;
  }
  
  .error-details {
    background-color: #f8f9fa;
    border-left: 4px solid #dc3545;
    padding: 15px;
    margin-bottom: 30px;
    text-align: left;
    border-radius: 5px;
    font-size: 14px;
    color: #555;
  }
  
  .button-group {
    display: flex;
    gap: 10px;
    justify-content: center;
  }
  
  button, a {
    padding: 12px 30px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    transition: background-color 0.3s;
    display: inline-block;
  }
  
  .btn-back {
    background-color: #007bff;
    color: white;
  }
  
  .btn-back:hover {
    background-color: #0056b3;
  }
  
  .btn-home {
    background-color: #6c757d;
    color: white;
  }
  
  .btn-home:hover {
    background-color: #5a6268;
  }
  
  /* スマホ対応 */
  @media (max-width: 768px) {
    .error-container {
      padding: 25px;
    }
    
    h1 {
      font-size: 24px;
    }
    
    .error-message {
      font-size: 14px;
    }
    
    .button-group {
      flex-direction: column;
    }
    
    button, a {
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
    申し訳ございません。処理中にエラーが発生しました。<br>
    もう一度お試しいただくか、下記のボタンからログインページに戻ってください。
  </div>
  
  <div class="error-details">
    <strong>エラー情報:</strong><br>
    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "予期しないエラーが発生しました" %>
  </div>
  
  <div class="button-group">
    <a href="/d3/LoginServlet" class="btn-back">← ログインページに戻る</a>
  </div>
</div>

</body>
</html>
