package com.nft.Util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Util {

	// 날짜 형식 변환 (yyyy-MM-dd로 들어온 date -> yyyy-MM-dd HH:mm:ss)
	public static String dateFormatHms(String inputDate) {

		SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date newDate;
		String resultDate = null;

		try {
			newDate = input.parse(inputDate);
			resultDate = output.format(newDate);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			// NullPointerException 시 null로 return
			return null;
		}

		return resultDate;

	}

	// 날짜 형식 변환 (yyyy-MM-dd HH:mm:ss로 들어온 date -> yyyy-MM-dd)
	public static String dateFormatYms(String inputDate) {

		SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate;
		String resultDate = null;

		try {
			newDate = input.parse(inputDate);
			resultDate = output.format(newDate);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			// NullPointerException 시 null로 return
			return null;
		}

		return resultDate;
	}

	// 금액에 콤마(,) 붙이기
	public static String DecimalFormat(long inputData) {

		String money = Long.toString(inputData);
		String resultMoney = "";
		resultMoney = money.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");

		return resultMoney;
	}
}
