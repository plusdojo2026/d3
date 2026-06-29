package apiAns;

// StringBuilderクラスの様々なメソッドの機能を確認するプログラム
public class StringBuilderTest {

	public static void main(String[] args) {
		// StringBuilderクラスのインスタンスを生成する
		StringBuilder sb = new StringBuilder("hello");

		// lengthメソッドを使って文字列sbの長さを求める
		System.out.println(sb.length());
		
		// charAtメソッドを使ってsbの先頭の1文字を取得する
		System.out.println(sb.charAt(0));
		
		// indexOfメソッドを使ってsbから"l"を検索する
		System.out.println(sb.indexOf("l"));
		
		// appendメソッドを使ってsbの末尾に", world"を追加する
		System.out.println(sb.append(", world"));
		
		// deleteメソッドを使ってsbの0文字目から7文字目未満までを削除する
		System.out.println(sb.delete(0, 7));
		
		// insertメソッドを使ってsbの0文字目に"Hi, "を挿入する
		System.out.println(sb.insert(0, "Hi, "));

		// replaceメソッドを使ってsbの4文字目から9文字目未満を"Java"に置き換える
		System.out.println(sb.replace(4, 9, "Java"));
	}

}
