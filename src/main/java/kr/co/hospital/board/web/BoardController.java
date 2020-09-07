package kr.co.hospital.board.web;

import kr.co.hospital.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
    private BoardService boardService;
    private String prefix = "/sub/board/";

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping("notice")
    public String notice(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "공지사항");
        return prefix + "notice";
    }

    @RequestMapping("notice-view")
    public String noticeView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "공지사항");
        return prefix + "noticeView";
    }

    @RequestMapping("media")
    public String media(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "미디어");
        return prefix + "media";
    }

    @RequestMapping("media-view")
    public String mediaView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "미디어");
        return prefix + "mediaView";
    }

    @RequestMapping("reserve")
    public String reserve(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "예약 상담 신청");
        return prefix + "reserve";
    }

    @RequestMapping("reserve-view")
    public String reserveView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "예약 상담 신청");
        return prefix + "reserveView";
    }

    @RequestMapping(value = "reserve-write", method = RequestMethod.GET)
    public String reserveWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "예약 상담 신청");
        return prefix + "reserveWrite";
    }

    @RequestMapping("case")
    public String caseList(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료사례");
        return prefix + "case";
    }

    @RequestMapping("case-view")
    public String caseView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료사례");
        return prefix + "caseView";
    }

    @RequestMapping("online-consult")
    public String onlineConsult(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsult";
    }

    @RequestMapping("online-consult-view")
    public String onlineConsultView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsultView";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.GET)
    public String onlineConsultWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsultWrite";
    }

    @RequestMapping("review")
    public String review(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        return prefix + "review";
    }

    @RequestMapping("review-view")
    public String reviewView(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        return prefix + "reviewView";
    }

    @RequestMapping(value = "review-write", method = RequestMethod.GET)
    public String reviewWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        return prefix + "reviewWrite";
    }
}
