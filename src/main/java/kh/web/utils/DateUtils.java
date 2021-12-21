package kh.web.utils;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class DateUtils {
	public static Date changeDate(String some) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(sdf.parse(some).getTime());
		return date;
	}
}
