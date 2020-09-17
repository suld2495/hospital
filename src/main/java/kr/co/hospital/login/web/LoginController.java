package kr.co.hospital.login.web;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import jdk.nashorn.internal.parser.JSONParser;
import kr.co.hospital.login.service.LoginService;
import kr.co.hospital.login.service.NaverLoginBO;
import kr.co.hospital.login.service.UserVo;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {
    private NaverLoginBO naverLoginBO;
    private LoginService loginService;
    private Gson gson;

    private String apiResult = null;

    public LoginController(NaverLoginBO naverLoginBO, LoginService loginService, Gson gson) {
        this.naverLoginBO = naverLoginBO;
        this.loginService = loginService;
        this.gson = gson;
    }

    @RequestMapping("/login")
    public String login(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        model.addAttribute("naverUrl", naverAuthUrl);
        model.addAttribute("category", 6);
        model.addAttribute("urlName", "회원로그인");
        return "/sub/login/login";
    }

    @RequestMapping("naver-callback")
    public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
        Map result = gson.fromJson(apiResult, Map.class);
        UserVo user = null;

        if (result.get("message").equals("success")) {
            Map info = (Map) result.get("response");
            Map param = new HashMap();
            param.put("provider", "naver");
            param.put("id", info.get("id"));

            user = loginService.getUserWithProvider(param);

            if (user == null) {
                user = new UserVo();
                user.setUniqueId((String) info.get("id"));
                user.setEmail((String) info.get("email"));
                user.setName((String) info.get("name"));
                user.setPassword("1");
                user.setServiceYN("Y");
                user.setPrivacyYN("Y");
                user.setProvider("naver");
                user.setId((String) info.get("email"));
                user.setPhone("-");
                loginService.insertUser(user);
            }
        } else {
            return "redirect:/login?error=naver_error";
        }

        List<GrantedAuthority> roles = new ArrayList<>(1);
        String roleStr = "ROLE_USER";
        roles.add(new SimpleGrantedAuthority(roleStr));

        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
        SecurityContextHolder.getContext().setAuthentication(auth);
        return "redirect:/";
    }

    @RequestMapping("/member_agreement")
    public String memberAgreement(Model model) {
        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        return "/sub/member/memberAgreement";
    }

    @RequestMapping(value = "/member_input", method = RequestMethod.POST)
    public String memberInput(Model model, @RequestParam Map map, @ModelAttribute(value = "userVo") UserVo userVo) {
        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        model.addAttribute("agree", map);
        return "/sub/member/member";
    }

    @RequestMapping(value = "/member_insert", method = RequestMethod.POST)
    public String memberComplete(Model model, @ModelAttribute(value = "userVo") @Valid UserVo userVo, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            return "/sub/member/member";
        }

        loginService.insertUser(userVo);

        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        return "redirect:/member_complete?id=" + userVo.getId();
    }

    @RequestMapping(value = "/member_complete", method = RequestMethod.GET)
    public String memberComplete(Model model) {
        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        return "/sub/member/memberComplete";
    }

    @RequestMapping(value = "/member_naver", method = RequestMethod.GET)
    public String memberNaver(Model model) {
        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        return "/sub/member/memberNaver";
    }

    @RequestMapping("/member_kakao")
    public String memberKakao(Model model) {
        model.addAttribute("category", 7);
        model.addAttribute("urlName", "회원가입");
        return "/sub/member/memberKakao";
    }

    @ResponseBody
    @RequestMapping("id_check")
    public boolean checkId() {
        return true;
    }
}
