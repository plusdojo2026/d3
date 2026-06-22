<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.UUID" %>
<html>
<head>
    <title>画像アップロード & プレビュー</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .preview-box { margin-top: 20px; }
        .preview-img { max-width: 300px; max-height: 300px; border: 1px solid #ccc; padding: 5px; }
        .error { color: red; }
        .success { color: green; }
    </style>
</head>
<body>

    <h2>画像アップロード（1ファイル限定）</h2>

    <% 
        String message = (String) request.getAttribute("message");
        String uploadedFilePath = (String) request.getAttribute("uploadedFilePath");
        if (message != null) { 
    %>
        <p class="success"><%= message %></p>
    <% } %>

    <form action="${pageContext.request.contextPath}/UploadServlet" method="post" enctype="multipart/form-data">
        <input type="file" name="imageFile" accept="image/*" required>
        <button type="submit">アップロードしてプレビュー</button>
    </form>

    <% if (uploadedFilePath != null) { %>
        <div class="preview-box">
            <h3>登録プレビュー:</h3>
            <img src="${pageContext.request.contextPath}/<%= uploadedFilePath %>?t=<%= System.currentTimeMillis() %>" 
                 alt="プレビュー画像" class="preview-img">
            <p>保存パス: <code>webapp/<%= uploadedFilePath %></code></p>
        </div>
    <% } %>

</body>
</html>