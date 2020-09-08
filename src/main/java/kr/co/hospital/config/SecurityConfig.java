package kr.co.hospital.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new ShaPasswordEncoder(256));
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/resources/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // 1. ACL 설정
        http.authorizeRequests()
                .antMatchers("/review-write").authenticated()
                .antMatchers("/case-view").authenticated()
                .antMatchers("/online-consult-write").authenticated()
                .antMatchers("/reserve-write").authenticated()
                .antMatchers("/reserve-view").authenticated()
                .antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN")
                .anyRequest().permitAll();

        http.csrf().disable();

        // 2. 로그인 설정
        http
                .formLogin()
                .loginPage("/login")    // 로그엔 페이지 url
                .loginProcessingUrl("/login/auth") // view form의 action 값
                .failureUrl("/login?result=fail")
                .defaultSuccessUrl("/", true)
                .usernameParameter("id")
                .passwordParameter("password");

        // 3. 로그아웃 설정
        http
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true);
    }
}
