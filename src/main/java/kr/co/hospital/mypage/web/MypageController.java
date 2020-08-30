package kr.co.hospital.mypage.web;

import kr.co.hospital.mypage.service.MypageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
    private MypageService mypageService;

    public MypageController(MypageService mypageService) {
        this.mypageService = mypageService;
    }

    @RequestMapping("/mypage_reservation")
    public String mypageReservation(Model model) {
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "예약내역");
        return "/sub/mypage/mypageReservation";
    }

    @RequestMapping("/mypage_consult")
    public String mypageConsult(Model model) {
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "온라인 상담");
        return "/sub/mypage/mypageConsult";
    }

    @RequestMapping("/mypage_update")
    public String mypageUpdate(Model model) {
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "회원정보수정");
        return "/sub/mypage/mypageUpdate";
    }
}
