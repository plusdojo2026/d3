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
  
  .title-area {
    background-color: white;
    height: 50px;
    display: flex;
    align-items: center;
    padding-left: 15px;
    font-size: 2rem;
    font-family: serif;
}
  
  
  .error-message {
    color: #666;
    font-size: 16px;
    margin-bottom: 30px;
    line-height: 1.6;
  }
  
  .btn-back {
    background-color: white;
    color: #e6e20a;
  }

  /* スマホ対応 */
  @media (max-width: 768px) {
    .error-container {
      padding: 25px;
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
  
 .error-img {
 width: 60%;
 text-align: center;
 }
  .hot-img {
 width: 80%;
 text-align: center;
 }
 
body {
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
</head>

<body>
<div class="title-area">Brew List</div>
 


	<img src="images/error.png"class="error-img" alt="">
  
  <div class="error-message">
    エラーが発生しました。<br>
    もう一度お試しいただくか、下記のボタンからログインページに戻ってください。<br>
    それか、一度コーヒーを飲んで落ち着きましょう。
  </div>
  
  <div class="error-details">
    エラー情報:<br>
    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "予期しないエラーが発生しました" %>
  </div>
  
  <div class="button-group">
    <a href="/d3/LoginServlet" class="btn-back">← ログインページに戻る</a>
  </div>
  
	<img src="images/hot.png"class="hot-img" alt="">


</body>
</html>
