package dbconn;

import java.util.Calendar;
public class NowTime {

		 Calendar cal = Calendar.getInstance();
	     int year = cal.get(Calendar.YEAR);
	     int mon = cal.get(Calendar.MONTH);
	     int day = cal.get(Calendar.DAY_OF_MONTH);
	     int hour = cal.get(Calendar.HOUR_OF_DAY);
	     int min = cal.get(Calendar.MINUTE);
	     int sec = cal.get(Calendar.SECOND);
	     
		@Override
		public String toString() {
			return year + "." + mon + "." + day + " " + hour + ":" + min + ":" + sec;
		}
	}

