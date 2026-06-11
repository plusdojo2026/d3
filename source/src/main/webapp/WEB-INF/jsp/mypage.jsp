<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
                <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>my page</title>
                    
                        <link rel="stylesheet" href="css/style.css">
                    </head>
                        <body>
                            <!-- ヘッダー -->
                             <header class="header">
                            <header>
                            <h1>マイページ</h1>
                            </header>
                            <!-- ヘッダーここまで -->
                            <h2 >usernameさん</h2>
                            <!-- メイン  -->

                                <main>
                                
                                <h2 >あなたのコーヒーの好み</h2>
                                <!--/*送りたい先のサーブレットを設定*/-->
                                    <form action="???????">
                                        <p>
                                            <label for="level">お問い合わせの種類<br></label>
                                            <select name="kind">
                                                <option value="1">あっさり</option>
                                                <option value="2">普通</option>
                                                <option value="3">濃いめ</option>
                                            </select>
                                           <a class="submit"><input type="submit" value="確定"></a>
                                        </p>
                                    </form>

                                </main>
                                <!--mainここまで-->

                        <footer>
                            

                        </footer>

                    </body>

