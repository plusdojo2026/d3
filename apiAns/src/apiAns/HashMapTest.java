package apiAns;

import java.util.HashMap;
import java.util.Map;

// HashMapクラスの様々なメソッドの機能を確認するプログラム
public class HashMapTest {

	public static void main(String[] args) {
		// 文字列と文字列を対応付けて格納するためのHashMapクラスのインスタンスを生成する
		Map<String, String> strMap = new HashMap<String, String>();
		
		// putメソッドを使って3つの要素を追加する
		strMap.put("apple", "リンゴ");
		strMap.put("orange", "ミカン");
		strMap.put("banana", "バナナ");
		System.out.println(strMap);

		// sizeメソッドを使って現在の要素数を得る
		System.out.println(strMap.size());
		
		// getメソッドを使って"orange"というキーに対応付けられた値を得る
		System.out.println(strMap.get("orange"));
		
		// replaceメソッドを使って"orange"というキーに対応付けられた値を"オレンジ"に変更する
		strMap.replace("orange", "オレンジ");
		System.out.println(strMap);
		
		// removeメソッドを使って"orange"というキーを持つ要素を削除する
		strMap.remove("orange");
		System.out.println(strMap);		
	}

}
