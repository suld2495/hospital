package kr.co.hospital.board.web;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.OnlineConsultValidator;
import kr.co.hospital.board.service.PagingVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class BoardController {
    private BoardService boardService;
    private OnlineConsultValidator onlineConsultValidator;
    private String prefix = "/sub/board/";

    public BoardController(BoardService boardService, OnlineConsultValidator onlineConsultValidator) {
        this.boardService = boardService;
        this.onlineConsultValidator = onlineConsultValidator;
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
        PagingVo pagingVo = new PagingVo("media", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "미디어");
        model.addAttribute("board", board);
        return prefix + "mediaView";
    }

    @RequestMapping(value = "reserve-write", method = RequestMethod.GET)
    public String reserveWrite(Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "예약 상담 신청");
        return prefix + "reserveWrite";
    }

    @RequestMapping(value = "reserve-write", method = RequestMethod.POST)
    public String reserveWritePost(Model model, @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            return prefix + "reserveWrite";
        }

        boardVo.setTableName("reserve");
        boardService.insertBoard(boardVo);

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/reserve-write";
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
        PagingVo pagingVo = new PagingVo("case", boardNum);
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
        PagingVo pagingVo = new PagingVo("online", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        model.addAttribute("board", board);
        return prefix + "onlineConsultView";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.GET)
    public String onlineConsultWrite(Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsultWrite";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.POST)
    public String onlineConsultWritePost(Model model, @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo, BindingResult result) throws Exception {

        onlineConsultValidator.validate(boardVo, result);

        if (result.hasErrors()) {
            return prefix + "onlineConsultWrite";
        }

        boardVo.setTableName("online");
        boardService.insertBoard(boardVo);

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/online-consult/1";
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
        PagingVo pagingVo = new PagingVo("review", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        model.addAttribute("board", board);
        return prefix + "reviewView";
    }

    @RequestMapping(value = "review-write", method = RequestMethod.GET)
    public String reviewWrite(Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) {
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료후기");
        return prefix + "reviewWrite";
    }

    @RequestMapping(value = "review-write", method = RequestMethod.POST)
    public String reviewWritePost(Model model, @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo, BindingResult result) throws Exception {

        if (result.hasErrors()) {
            return prefix + "reviewWrite";
        }

        boardVo.setTableName("review");
        boardService.insertBoard(boardVo);

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/review-view/" + boardVo.getNum();
    }
}
