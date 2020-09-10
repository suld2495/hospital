package kr.co.hospital.login.web;

import kr.co.hospital.login.service.LoginService;
import kr.co.hospital.login.service.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class LoginController {
    private LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("category", 6);
        model.addAttribute("urlName", "회원로그인");
        return "/sub/login/login";
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
