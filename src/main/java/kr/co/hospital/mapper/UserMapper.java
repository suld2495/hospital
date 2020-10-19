package kr.co.hospital.mapper;

import kr.co.hospital.login.service.UserVo;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface UserMapper {
    UserVo getUser(String username);

    void insertUser(UserVo userVo) throws Exception;

    UserVo getUserWithProvider(Map param) throws Exception;

    void updateUser(UserVo userVo);

    String searchId(UserVo userVo) throws Exception;

    String searchPassword(UserVo userVo) throws Exception;

    void updatePassword(UserVo userVo) throws Exception;
}
