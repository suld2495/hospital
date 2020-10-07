package kr.co.hospital.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Map;

public class StringUtil {
    private static Log log = LogFactory.getLog(StringUtil.class);

    public static String ext(String filename) {
        int pos = filename.lastIndexOf(".");
        String ext = filename.substring(pos + 1);
        return ext;
    }

    public static Map changeString(Map board) throws UnsupportedEncodingException {
        for (Iterator<String> it = board.keySet().iterator(); it.hasNext();) {
            String key = it.next();

            if (key != null && board.get(key) instanceof byte[]) {
                board.put(key, changeString(board.get(key)));
            }
        }

        return board;
    }

    public static String changeString(Object object) throws UnsupportedEncodingException {
        return new String((byte[]) object, "UTF-8");
    }
}
