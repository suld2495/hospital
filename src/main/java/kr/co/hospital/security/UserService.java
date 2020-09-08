package kr.co.hospital.security;

import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserVo userVo = userMapper.getUser(username);
        SecurityUser securityUser = new SecurityUser();

        if (userVo != null) {
            securityUser.setUsername(userVo.getId());
            securityUser.setPassword(userVo.getPassword());

            List<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(userVo.getRole()));

            securityUser.setAuthorities(authorities);
        }

        return securityUser;
    }
}
