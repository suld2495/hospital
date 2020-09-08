package kr.co.hospital.mapper;

import kr.co.hospital.login.service.UserVo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    UserVo getUser(String username);

    void insertUser(UserVo userVo) throws Exception;
}
