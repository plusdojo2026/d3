package apiAns;

import java.util.HashSet;
import java.util.Set;

//HashSetクラスの様々なメソッドの機能を確認するプログラム
public class HashSetTest {

	public static void main(String[] args) {
		// 文字列を格納するためのHashSetクラスのインスタンスを生成する
		Set<String> strSet = new HashSet<String>();
		
		// addメソッドを使って3つの要素を追加する
		strSet.add("apple");
		strSet.add("orange");
		strSet.add("banana");
		strSet.add("orange");	// 同じデータを格納すると無視される
		System.out.println(strSet);
		
		// sizeメソッドを使って現在の要素数を得る
		System.out.println(strSet.size());
		
		// containsメソッドを使って"orange"が含まれているかどうかを確認する
		System.out.println(strSet.contains("orange"));
		
		// removeメソッドを使って"orange"を削除する
		strSet.remove("orange");
		System.out.println(strSet);
	}

}
