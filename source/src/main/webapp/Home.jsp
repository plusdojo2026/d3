<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ユーザー情報</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    padding: 20px;
  }
  
  h1 {
    font-size: 28px;
    margin-bottom: 30px;
    color: #333;
    text-align: center;
  }
  
  .user-info-container {
    background-color: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    max-width: 500px;
    margin: 0 auto;
  }
  
  .info-item {
    margin-bottom: 20px;
    padding: 15px;
    background-color: #f9f9f9;
    border-left: 4px solid #007bff;
    border-radius: 5px;
  }
  
  .info-label {
    font-weight: bold;
    color: #555;
    font-size: 14px;
    margin-bottom: 5px;
  }
  
  .info-value {
    font-size: 18px;
    color: #333;
    word-break: break-all;
  }
  
  /* スマホ対応 */
  @media (max-width: 768px) {
    body {
      padding: 15px;
    }
    
    h1 {
      font-size: 24px;
    }
    
    .user-info-container {
      padding: 15px;
    }
    
    .info-item {
      padding: 12px;
      margin-bottom: 15px;
    }
    
    .info-label {
      font-size: 12px;
    }
    
    .info-value {
      font-size: 16px;
    }
  }
</style>
</head>
<body>
<h1>ユーザー情報</h1>

<div class="user-info-container">
  <div class="info-item">
    <div class="info-label">ID</div>
    <div class="info-value">${id.id}</div>
  </div>
  
  <div class="info-item">
    <div class="info-label">メールアドレス</div>
    <div class="info-value">${id.email}</div>
  </div>
  
  <div class="info-item">
    <div class="info-label">ユーザー名</div>
    <div class="info-value">${id.user}</div>
  </div>
  
  <div class="info-item">
    <div class="info-label">パスワード</div>
    <div class="info-value">${id.password}</div>
  </div>
  
  <div class="info-item">
    <div class="info-label">レベル</div>
    <div class="info-value">${id.mylevel}</div>
  </div>
</div>

<a href="/d3/logout.jsp">ログアウト</a>


</body>
</html>
