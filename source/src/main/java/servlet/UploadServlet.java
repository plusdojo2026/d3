package servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
// アップロードを受け付けるための必須アノテーション（サイズ制限などは環境に合わせて調整してください）
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    // アップロード先のディレクトリ名
    private static final String UPLOAD_DIR = "upload_img";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // リクエストの文字コード設定
        request.setCharacterEncoding("UTF-8");

        // webapp配下の「upload_img」フォルダのサーバー上での絶対パスを取得
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // フォルダが存在しない場合は作成
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = "";
        String message = "";
        String jspPath = "upload_img"; // JSP側に渡す相対パスの起点

        try {
            // "imageFile" というname属性のパートを取得（1つだけ）
            Part part = request.getPart("imageFile");
            
            // アップロードされたファイル名を取得
            fileName = getSubmittedFileName(part);

            if (fileName != null && !fileName.isEmpty()) {
                // 同名ファイルの衝突を防ぐため、必要に応じてファイル名に一意の値を付与することをおすすめします
                // 例: fileName = System.currentTimeMillis() + "_" + fileName;
                
                // ファイルの書き込み（指定フォルダへ保存）
                String savePath = uploadFilePath + File.separator + fileName;
                part.write(savePath);
                
                message = "ファイルのアップロードに成功しました！";
                // JSP表示用に、webappからの相対パスを設定
                request.setAttribute("uploadedFilePath", UPLOAD_DIR + "/" + fileName);
            } else {
                message = "ファイルが選択されていません。";
            }

        } catch (Exception e) {
            message = "エラーが発生しました: " + e.getMessage();
            e.printStackTrace();
        }

        // 結果をJSPに引き継いで、画面を再表示（プレビュー表示）
        request.setAttribute("message", message);
        request.getRequestDispatcher("/upload.jsp").forward(request, response);
    }

    /**
     * Partからファイル名を取得する補助メソッド
     * ※Servlet 3.1以降であれば part.getSubmittedFileName() が使えますが、
     * 互換性のためにヘッダーから解析するロジックにしています。
     */
    private String getSubmittedFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                String filename = token.substring(token.indexOf("=") + 2, token.length() - 1);
                // ブラウザによっては絶対パスで返ってくることがあるため、ファイル名のみを切り出す
                return Paths.get(filename).getFileName().toString();
            }
        }
        return "";
    }
}
