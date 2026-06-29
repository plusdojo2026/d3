package apiAns;

import java.util.Calendar;
import java.util.Date;

// DateクラスとCalendarクラスの機能を確認するプログラム
public class DateCalTest {

	public static void main(String[] args) {
		// Dateクラスのインスタンスを生成して現在日時を取得します
		Date now = new Date();

		// Calendarクラスのインスタンスを取得して現在日時を設定します
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		
		// 現在日時を、年、月、日、曜日、時、分、秒に分けて取得します
		// 月は、1月～12月が、0～11で得られます
		// 曜日は、日曜日～土曜日が、1～7で得られます
		String[] day_of_week = { "日", "月", "火", "水", "木", "金", "土" };
		System.out.println(cal.get(Calendar.YEAR) + "年"
				+ (cal.get(Calendar.MONTH) + 1) + "月"
				+ cal.get(Calendar.DAY_OF_MONTH) + "日"
				+ day_of_week[cal.get(Calendar.DAY_OF_WEEK) - 1] + "曜日"
				+ String.format("%02d", cal.get(Calendar.HOUR_OF_DAY)) + "時"
				+ String.format("%02d", cal.get(Calendar.MINUTE)) + "分"
				+ String.format("%02d", cal.get(Calendar.SECOND)) + "秒");
	}

}
