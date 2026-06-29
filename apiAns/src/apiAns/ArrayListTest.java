package apiAns;

import java.util.ArrayList;
import java.util.List;

// ArrayListクラスの様々なメソッドの機能を確認するプログラム
public class ArrayListTest {

	public static void main(String[] args) {
		// 文字列を格納するためのArrayListクラスのインスタンスを生成する
		List<String> strList = new ArrayList<String>();
		
		// addメソッドを使って3つの要素を追加する
		strList.add("apple");
		strList.add("orange");
		strList.add("banana");
		System.out.println(strList);
		
		// sizeメソッドを使って現在の要素数を得る
		System.out.println(strList.size());

		// addメソッドを使って1番目の位置に"grape"を挿入する
		strList.add(1, "grape");
		System.out.println(strList);
		
		// getメソッドを使って1番目の要素を取得する
		System.out.println(strList.get(1));
		
		// setメソッドを使って1番目の要素を"lemon"に置き換える
		strList.set(1, "lemon");
		System.out.println(strList);
		
		// indexOfメソッドを使って"lemon"を検索する
		System.out.println(strList.indexOf("lemon"));
		
		// removeメソッドを使って1番目の要素を削除する
		strList.remove(1);
		System.out.println(strList);
	}

}
