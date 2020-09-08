package kr.co.hospital.login.service.impl;

import kr.co.hospital.login.service.LoginService;
import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.mapper.UserMapper;
import kr.co.hospital.util.EncodingUtil;
import org.springframework.security.crypto.util.EncodingUtils;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    private UserMapper userMapper;

    public LoginServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public void insertUser(UserVo userVo) throws Exception {
        userVo.setPassword(EncodingUtil.encode(userVo.getPassword()));
        userMapper.insertUser(userVo);
    }
}
