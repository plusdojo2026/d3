<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ログアウト</title>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  
  .logout-container {
    background-color: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    text-align: center;
    max-width: 400px;
  }
  
  h1 {
    color: #333;
    margin-bottom: 20px;
  }
  
  p {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
  }
  
  .button-group {
    display: flex;
    gap: 10px;
    justify-content: center;
  }
  
  button {
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  
  .btn-logout {
    background-color: #dc3545;
    color: white;
  }
  
  .btn-logout:hover {
    background-color: #c82333;
  }
  
  .btn-cancel {
    background-color: #6c757d;
    color: white;
  }
  
  .btn-cancel:hover {
    background-color: #5a6268;
  }
</style>
</head>
<body>

<div class="logout-container">
  <h1>ログアウト</h1>
  <p>ログアウトしてもよろしいですか？</p>
  
  <div class="button-group">
    <form method="post" style="margin: 0;">
      <button type="submit" class="btn-logout" name="action" value="logout">ログアウト</button>
    </form>
    <button class="btn-cancel" onclick="history.back()">キャンセル</button>
  </div>
</div>

<%
    // ログアウトボタンが押された場合
    if ("logout".equals(request.getParameter("action"))) {
        // セッションを無効化
        session.invalidate();
        
        // ログインページにリダイレクト
        response.sendRedirect("/d3/LoginServlet");
    }
%>

</body>
</html>
