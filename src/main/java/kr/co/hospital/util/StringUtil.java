package kr.co.hospital.util;

import kr.co.hospital.login.service.UserVo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public class StringUtil {
    private static Log log = LogFactory.getLog(StringUtil.class);

    public static String ext(String filename) {
        int pos = filename.lastIndexOf(".");
        String ext = filename.substring(pos + 1);
        return ext;
    }

    public static Map changeString(Map board) throws UnsupportedEncodingException {
        String[] keys = {"subject", "contents", "writer", "thumnail", "thumnail_path", "main_thumnail_img", "real_main_thumnail_img", "real_thumnail", "id", "status", "created_show_date", "prevSubject", "nextSubject"};

        for (int i = 0; i < keys.length; i++) {
            if (board.get(keys[i]) != null && !(board.get(keys[i]) instanceof String)) {
                board.put(keys[i], changeString(board.get(keys[i])));
            }
        }

        return board;
    }

    public static String changeString(Object object) throws UnsupportedEncodingException {
        return new String((byte[]) object, "UTF-8");
    }
}
