<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登録結果</title>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  body {
    font-family: 'Arial', sans-serif;
    background: #E6E20A;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
  }
  
  .result-container {
    background-color: white;
    border-radius: 10px;
    
    padding: 40px;
    max-width: 500px;
    text-align: center;
  }
  
  .result-icon {
    font-size: 60px;
    margin-bottom: 20px;
  }
  
  .success .result-icon {
    color: #9C6849;
  }
  
  .error .result-icon {
    color: #dc3545;
  }
  
  h1 {
    font-size: 28px;
    margin-bottom: 15px;
  }
  
  .success h1 {
    color: #9C6849;
  }
  
  .error h1 {
    color: #dc3545;
  }
  
  .message {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
    line-height: 1.6;
  }
  
  .button-group {
    display: flex;
    gap: 10px;
    justify-content: center;
  }
  
  a {
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
    background-color: #804040;
    color: white;
  }
  
 
  
  .btn-secondary {
    background-color: #804040;
    color: #804040;
  }
  
  .btn-secondary:hover {
    background-color: #5a6268;
  }
  
  /* スマホ対応 */
  @media (max-width: 768px) {
    .result-container {
      padding: 25px;
    }
    
    h1 {
      font-size: 24px;
    }
    
    .message {
      font-size: 14px;
    }
    
    .button-group {
      flex-direction: column;
    }
    
    a {
      width: 100%;
    }
  }
</style>
</head>
<body>

<div class="result-container <%= (Boolean)request.getAttribute("isSuccess") ? "success" : "error" %>">
  <div class="result-icon">
    <%= (Boolean)request.getAttribute("isSuccess") ? "✓" : "✕" %>
  </div>
  
  <h1><%= request.getAttribute("title") %></h1>
  
  <div class="message">
    <%= request.getAttribute("message") %>
  </div>
  
  <div class="button-group">
    <!-- ✅ 修正：redirectUrl に contextPath が含まれているので、そのまま使用 -->
    <a href="<%= request.getAttribute("redirectUrl") %>" 
       class="btn-primary">
      <%= (Boolean)request.getAttribute("isSuccess") ? "ログインページへ" : "登録ページへ戻る" %>
    </a>
  </div>
</div>

</body>
</html>
