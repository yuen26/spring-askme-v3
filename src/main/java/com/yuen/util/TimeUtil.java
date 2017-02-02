package com.yuen.util;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class TimeUtil {

    public static String ago(Date past) throws ParseException {
        // Now time
        Date now = Calendar.getInstance().getTime();

        // Calculate
        long x = TimeUnit.MILLISECONDS.toSeconds(now.getTime() - past.getTime());
        long[] num = {31536000, 2592000, 604800, 86400, 3600, 60, 1};
        String[] text = {"năm", "tháng", "tuần", "ngày", "giờ", "phút", "giây"};
        String str = "";

        for (int i = 0; i < num.length; i++) {
            if (x < num[i]) {
                continue;
            }
            str = (int) Math.floor(x / num[i]) + " " + text[i];
            break;
        }

        if (str.equals("")) {
            return "Vừa xong";
        } else {
            return str + " trước";
        }
    }
    
}
