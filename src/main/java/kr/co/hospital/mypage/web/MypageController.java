package kr.co.hospital.mypage.web;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.mypage.service.MypageService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MypageController {
    private MypageService mypageService;
    private BoardService boardService;

    public MypageController(MypageService mypageService, BoardService boardService) {
        this.mypageService = mypageService;
        this.boardService = boardService;
    }

    @RequestMapping("/mypage_reservation/{currentPage}")
    public String mypageReservation(Model model,
                                    Authentication auth,
                                    @PathVariable(value="currentPage") int currentPage) throws Exception {
        if (auth.getPrincipal() != null) {
            PagingVo pagingVo = new PagingVo(10, currentPage, "reserve", "", "");
            UserVo userVo = (UserVo) auth.getPrincipal();
            pagingVo.setId(userVo.getId());
            model.addAttribute("list", boardService.getBoardList(pagingVo));
            model.addAttribute("paging", pagingVo);
        }

        model.addAttribute("category", 8);
        model.addAttribute("urlName", "예약내역");
        return "/sub/mypage/mypageReservation";
    }

    @RequestMapping("/mypage_consult/{currentPage}")
    public String mypageConsult(Model model,
                                Authentication auth,
                                @PathVariable(value="currentPage") int currentPage,
                                @RequestParam(value = "search_text", required = false) String search_text,
                                @RequestParam(value = "type", required = false) String type) throws Exception {

        if (auth.getPrincipal() != null) {
            PagingVo pagingVo = new PagingVo(10, currentPage, "online", search_text, type);
            UserVo userVo = (UserVo) auth.getPrincipal();
            pagingVo.setId(userVo.getId());
            model.addAttribute("list", boardService.getBoardList(pagingVo));
            model.addAttribute("paging", pagingVo);
        }

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

    @RequestMapping(value = "/membership_widthdrawal", method = RequestMethod.GET)
    public String membershipWithdrawal(Model model) {
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "회원탈퇴");
        return "/sub/mypage/membershipWithdrawal";
    }

    @RequestMapping(value = "/membership_widthdrawal", method = RequestMethod.POST)
    public String membershipWithdrawalComplete(Model model) {
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "회원탈퇴");
        return "/sub/mypage/membershipWithdrawalComplete";
    }

    @RequestMapping("mypage-consult-view/{boardNum}")
    public String mypageConsultView(Model model,
                                    @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("online", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "온라인상담");
        model.addAttribute("board", board);
        return "/sub/mypage/mypageConsultView";
    }

    @RequestMapping("mypage-reserve-view/{boardNum}")
    public String mypageReserveView(Model model,
                                    @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("reserve", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 8);
        model.addAttribute("urlName", "예약내역");
        model.addAttribute("board", board);
        return "/sub/mypage/mypageReserveView";
    }
}