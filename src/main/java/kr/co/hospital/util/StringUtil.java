package kr.co.hospital.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StringUtil {
    private static Log log = LogFactory.getLog(StringUtil.class);

    public static String ext(String filename) {
        int pos = filename.lastIndexOf(".");
        String ext = filename.substring(pos + 1);
        return ext;
    }
}
