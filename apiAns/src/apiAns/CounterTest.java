package apiAns;

// Counterクラスのrunメソッドをマルチスレッドで実行するクラス
public class CounterTest {

	public static void main(String[] args) {
		// Counterクラスのインスタンスを3つ生成する
		Counter c1 = new Counter("スレッド1");
		Counter c2 = new Counter("スレッド2");
		Counter c3 = new Counter("スレッド3");

		// マルチスレッドを制御するインスタンスを3つ生成する
		Thread t1 = new Thread(c1);
		Thread t2 = new Thread(c2);
		Thread t3 = new Thread(c3);

		// 3つのスレッドの実行を開始する
		t1.start();
		t2.start();
		t3.start();
	}

}
