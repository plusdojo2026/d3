package apiAns;

// カウンタを表すクラス
public class Counter implements Runnable {
	// スレッドの識別名を保持するフィールド
	private String name;
	
	// マルチスレッドで実行されるrunメソッドの実行
	public void run() {
		// 1～100までの値を表示する
		for (int i = 1; i <= 100; i++) {
			// 現在の値を表示する
			System.out.println(this.name + "：" + i);

			// スレッドを100ミリ秒停止する
			try {
				Thread.sleep(100);
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
				break;
			}
		}
	}
	
	// コンストラクタ
	public Counter(String name) {
		this.name = name;
	}
}
