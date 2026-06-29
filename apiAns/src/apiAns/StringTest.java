package apiAns;

// Stringクラスの様々なメソッドの機能を確認するプログラム
public class StringTest {

	public static void main(String[] args) {
		// lengthメソッドを使って"hello"の長さを求める
		String s = "hello";
		System.out.println(s.length());

		// equalsメソッドを使ってsと"hello"を比較する
		System.out.println(s.equals("hello"));

		// equalsメソッドを使ってsと"HELLO"を比較する
		System.out.println(s.equals("HELLO"));
		
		// charAtメソッドを使ってsの先頭の1文字を取得する
		System.out.println(s.charAt(0));
		
		// indexOfメソッドを使ってsから"l"を検索する
		System.out.println(s.indexOf("l"));
		
		// toUpperCaseメソッドを使ってsをすべて大文字に変換した新たな文字列tを得る
		String t = s.toUpperCase();
		System.out.println(t);
		
		// replaceメソッドを使ってsの中にある'h'を'H'に置き換えた新たな文字列uを得る
		String u = s.replace('h', 'H');
		System.out.println(u);
		
		// staticなformatメソッドを使って10進数の15を2桁の16進数に（英字にA～Fを使う）
		// 置き換えた新たな文字列vを得る
		int x = 15;
		String v = String.format("%02X", x);
		System.out.println(v);
	}

}
