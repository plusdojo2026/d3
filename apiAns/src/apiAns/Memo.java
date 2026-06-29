package apiAns;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class Memo {
	// memo.txtの内容をリストに読み出すメソッド
	public static void readFile(List<String> memoList) {
		
		try {
			// ファイル読み出しの準備処理
			File file = new File("memo.txt");
			if (!file.exists()) {
				// ファイルが存在しない場合は何もせずに終了します
				return;
			}
			FileReader fr = new FileReader(file);
			BufferedReader br = new BufferedReader(fr);
			
			// ファイルから1行ずつ読み出してリストに追加します
			String s;
			while ((s = br.readLine()) != null) {
				memoList.add(s);
			}
			
			// ファイル読み出しの終了処理
			br.close();
			fr.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		
	}
	
	// リストの内容をmemo.txtに書き込むメソッド
	public static void writeFile(List<String> memoList) {
		try {
			// ファイル書き込みの準備処理
			File file = new File("memo.txt");
			FileWriter fw = new FileWriter(file);
			BufferedWriter bw = new BufferedWriter(fw);
		
			// リストの内容をファイルに書き込みます
			for (String s : memoList) {
				bw.write(s);
				bw.newLine();
			}
		
			// ファイル書き込みの終了処理
			bw.close();
			fw.close();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// リストの内容を一覧表示するメソッド
	public static void showList(List<String> memoList) {
		int listSize = memoList.size();
		int number = 1;
		int i = 0;
		while (i < listSize) {
			System.out.print("(" + number + ")");	// 番号を表示する
			number++;
			System.out.println(memoList.get(i));	// 日時を表示する
			i++;
			System.out.println(memoList.get(i));	// メモを表示する
			i++;
		}
	}
	
	// 現在の日時を"2022/01/07 10:45:06"という形式の文字列で返すメソッド
	public static String getDate() {
		// Dateクラスのインスタンスを生成して現在日時を取得します
		Date now = new Date();

		// Calendarクラスのインスタンスを取得して現在日時を設定します
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		
		// "2022/01/07 10:45:06"という形式の文字列を返します。
		return String.format("%04d", cal.get(Calendar.YEAR)) + "/"
			+ String.format("%02d", cal.get(Calendar.MONTH) + 1) + "/"
			+ String.format("%02d", cal.get(Calendar.DAY_OF_MONTH)) + " "
			+ String.format("%02d", cal.get(Calendar.HOUR_OF_DAY)) + ":"
			+ String.format("%02d", cal.get(Calendar.MINUTE)) + ":"
			+ String.format("%02d", cal.get(Calendar.SECOND));
	}
	
	// リストにメモを登録するメソッド
	public static void registList(List<String> memoList, Scanner scn) {
		// メモをキー入力する
		System.out.print("メモ-->");
		String s = scn.next();
		
		// 日時とメモをリストに追加する
		memoList.add(Memo.getDate());
		memoList.add(s);
		System.out.println("登録しました。");
	}
	
	// リストからメモを削除するメソッド
	public static void deleteList(List<String> memoList, Scanner scn) {
		try {
			// 削除する番号をキー入力する
			System.out.print("削除する番号-->");
			int number = scn.nextInt();
		
			// 削除する添字を求める
			int index = (number - 1) * 2;
			// 添字が範囲を超えていたら終了する
			if (index < 0 || index > memoList.size()) {
				System.out.println("指定された番号のメモはありません。");
				return;
			}
			// 日時を削除する
			memoList.remove(index);
			// 1つ前にずれたメモを削除する
			memoList.remove(index);
			System.out.println("削除しました。");
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	// メインメソッド
	public static void main(String[] args) {
		// キー入力の準備処理
		Scanner scn = new Scanner(System.in);
		
		// 文字列を格納する空のリストを作成します。
		List<String> memoList = new ArrayList<String>();
		
		// memo.txtの内容をリストに読み出します
		Memo.readFile(memoList);
		
		// メニュー項目に合わせた処理を行います
		boolean contFlag = true;
		while (contFlag) {
			System.out.print("表示：S, 登録：R, 削除：D, 終了：Q -->");
			String item = scn.next();
			switch (item) {
			case "S":
			case "s":
				Memo.showList(memoList);
				break;
			case "R":
			case "r":
				Memo.registList(memoList, scn);
				break;
			case "D":
			case "d":
				Memo.deleteList(memoList, scn);
				break;
			case "Q":
			case "q":
				System.out.println("終了しました。");
				contFlag = false;
				break;
			}
		}
		
		// リストの内容をmemo.txtに書き込みます
		Memo.writeFile(memoList);

		// キー入力の終了処理
		scn.close();
	}

}
