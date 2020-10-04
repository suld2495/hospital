package kr.co.hospital.mypage.service;

import kr.co.hospital.login.service.UserVo;
import org.springframework.security.core.Authentication;

import java.util.Map;

public interface MypageService {
    boolean passwordCheck(Authentication auth, Map map);

    void updateUser(UserVo userVo);
}
