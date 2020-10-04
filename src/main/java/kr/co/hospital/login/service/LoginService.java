package kr.co.hospital.login.service;

import java.util.Map;

public interface LoginService {
    void insertUser(UserVo userVo) throws Exception;

    UserVo getUserWithProvider(Map param) throws Exception;

    String searchId(UserVo userVo) throws Exception;

    String searchPassword(UserVo userVo) throws Exception;
}
