package kr.co.hospital.mypage.service.impl;

import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.mapper.UserMapper;
import kr.co.hospital.mypage.service.MypageService;
import kr.co.hospital.util.EncodingUtil;
import kr.co.hospital.util.PasswordEncoding;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MypageServiceImpl implements MypageService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserDetailsService userDeSer;

    @Override
    public boolean passwordCheck(Authentication auth, Map map) {
        UserVo userVo = (UserVo) auth.getPrincipal();
        String password = (String) map.get("password");

        UserVo user = (UserVo) userDeSer.loadUserByUsername(userVo.getId());

        if(!matchPassword(password, user.getPassword())) {
            return false;
        }

        return true;
    }

    @Override
    public void updateUser(UserVo userVo) {
        userVo.setPassword(EncodingUtil.encode(userVo.getPassword()));
        userMapper.updateUser(userVo);
    }

    private boolean matchPassword(String loginPwd, String password) {
        PasswordEncoding encoding = new PasswordEncoding();
        return encoding.matches(loginPwd, password);
    }
}
