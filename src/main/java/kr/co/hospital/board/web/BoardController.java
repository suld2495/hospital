package kr.co.hospital.board.web;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.PagingVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    private BoardService boardService;
    private String prefix = "/sub/board/";

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @RequestMapping("notice/{currentPage}")
    public String notice(Model model,
                         @PathVariable(value="currentPage") int currentPage,
                         @RequestParam(value = "search_text", required = false) String search_text,
                         @RequestParam(value = "type", required = false) String type) throws Exception {
        PagingVo pagingVo = new PagingVo(10, currentPage, "notice", search_text, type);

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "공지사항");
        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        return prefix + "notice";
    }

    @RequestMapping("notice-view/{boardNum}")
    public String noticeView(Model model,
                             @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("notice", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "공지사항");
        model.addAttribute("board", board);
        return prefix + "noticeView";
    }

    @RequestMapping("media/{currentPage}")
    public String media(Model model,
                        @PathVariable(value="currentPage") int currentPage,
                        @RequestParam(value = "search_text", required = false) String search_text,
                        @RequestParam(value = "type", required = false) String type) throws Exception {
        PagingVo pagingVo = new PagingVo(8, currentPage, "media", search_text, type);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "미디어");
        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        return prefix + "media";
    }

    @RequestMapping("media-view/{boardNum}")
    public String mediaView(Model model,
                            @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("notice", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "미디어");
        model.addAttribute("board", board);
        return prefix + "mediaView";
    }

    @RequestMapping(value = "reserve-write", method = RequestMethod.GET)
    public String reserveWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "예약 상담 신청");
        return prefix + "reserveWrite";
    }

    @RequestMapping("case/{currentPage}")
    public String caseList(Model model,
                           @PathVariable(value="currentPage") int currentPage,
                           @RequestParam(value = "search_text", required = false) String search_text,
                           @RequestParam(value = "type", required = false) String type) throws Exception {
        PagingVo pagingVo = new PagingVo(8, currentPage, "treatment_case", search_text, type);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료사례");
        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        return prefix + "case";
    }

    @RequestMapping("case-view/{boardNum}")
    public String caseView(Model model,
                           @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("notice", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료사례");
        model.addAttribute("board", board);
        return prefix + "caseView";
    }

    @RequestMapping("online-consult/{currentPage}")
    public String onlineConsult(Model model,
                                @PathVariable(value="currentPage") int currentPage,
                                @RequestParam(value = "search_text", required = false) String search_text,
                                @RequestParam(value = "type", required = false) String type) throws Exception {
        PagingVo pagingVo = new PagingVo(10, currentPage, "online", search_text, type);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        return prefix + "onlineConsult";
    }

    @RequestMapping("online-consult-view/{boardNum}")
    public String onlineConsultView(Model model,
                                    @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("notice", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        model.addAttribute("board", board);
        return prefix + "onlineConsultView";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.GET)
    public String onlineConsultWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsultWrite";
    }

    @RequestMapping("review/{currentPage}")
    public String review(Model model,
                         @PathVariable(value="currentPage") int currentPage,
                         @RequestParam(value = "search_text", required = false) String search_text,
                         @RequestParam(value = "type", required = false) String type) throws Exception {
        PagingVo pagingVo = new PagingVo(8, currentPage, "review", search_text, type);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        return prefix + "review";
    }

    @RequestMapping("review-view/{boardNum}")
    public String reviewView(Model model,
                             @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("notice", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        model.addAttribute("board", board);
        return prefix + "reviewView";
    }

    @RequestMapping(value = "review-write", method = RequestMethod.GET)
    public String reviewWrite(Model model) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        return prefix + "reviewWrite";
    }
}
