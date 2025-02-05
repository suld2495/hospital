package kr.co.hospital.board.web;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.OnlineConsultValidator;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.mapper.BoardMapper;
import kr.co.hospital.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    private BoardService boardService;
    private String prefix = "/sub/board/";

    @Autowired
    private AdminService adminService;

    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    private ServletContext servletContext;

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
                        @RequestParam(value = "type", required = false) String type,
                        @RequestParam(value = "tab", required = false) String tab) throws Exception {
        PagingVo pagingVo = new PagingVo(8, currentPage, "media", search_text, type);
        pagingVo.setTab(tab);
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
    public String reserveWritePost(MultipartHttpServletRequest mRequest,
                                   Model model,
                                   @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo,
                                   BindingResult result,
                                   Authentication auth) throws Exception {

        if (result.hasErrors()) {
            return prefix + "reserveWrite";
        }

        boardVo.setTableName("reserve");
        UserVo userVo = (UserVo) auth.getPrincipal();
        boardVo.setId(userVo.getId());
        boardService.insertBoard(boardVo);
        boardService.saveFile(mRequest, boardVo.getNum(), "reserve");

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/reserve-write";
    }

    @RequestMapping("case/{currentPage}")
    public String caseList(Model model,
                           @PathVariable(value="currentPage") int currentPage,
                           @RequestParam(value = "search_text", required = false) String search_text,
                           @RequestParam(value = "type", required = false) String type,
                           @RequestParam(value = "tab", required = false) String tab) throws Exception {
        PagingVo pagingVo = new PagingVo(8, currentPage, "treatment_case", search_text, type);
        pagingVo.setTab(tab);
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

        if ("y".equals(board.get("board_answer_use"))) {
            PagingVo anserPagingVo = new PagingVo("answer", (Integer) board.get("num"));
            Map answer = StringUtil.changeString(boardMapper.selectBoardInfo(anserPagingVo));
            board.put("answer_num", answer.get("answer_num"));
            board.put("answer_contents", answer.get("answer_contents"));
        }
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        model.addAttribute("board", board);
        return prefix + "onlineConsultView";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.GET)
    public String onlineConsultWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        adminService.writeModule("online", map, request, model);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return prefix + "onlineConsultWrite";
    }

    @RequestMapping(value = "online-consult-write", method = RequestMethod.POST)
    public String onlineConsultWritePost(MultipartHttpServletRequest mRequest,
                                         Model model,
                                         @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo,
                                         @RequestParam Map map,
                                         BindingResult result,
                                         Authentication auth) throws Exception {
        if (result.hasErrors()) {
            return prefix + "onlineConsultWrite";
        }

        boardVo.setTableName("online");
        UserVo userVo = (UserVo) auth.getPrincipal();
        boardVo.setId(userVo.getId());

        if (map.get("update").equals("modify")) {
            boardService.updateBoard(boardVo);
        } else {
            boardService.insertBoard(boardVo);
        }

        boardService.saveFile(mRequest, boardVo.getNum(), "online");

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
    public String reviewWritePost(Model model, @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo, BindingResult result, Authentication auth) throws Exception {

        if (result.hasErrors()) {
            return prefix + "reviewWrite";
        }

        boardVo.setTableName("review");
        boardService.insertBoard(boardVo);
        UserVo userVo = (UserVo) auth.getPrincipal();
        boardVo.setId(userVo.getId());

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/review-view/" + boardVo.getNum();
    }

    @RequestMapping(value = "/fileUploader")
    public String fileUploader(MultipartHttpServletRequest mRequest, HttpServletRequest request, Model model) throws Exception {
        model.addAttribute("fileName", boardService.saveFile(mRequest));
        model.addAttribute("path", "download");
        return "board/callback";
    }

    @RequestMapping("/file-download")
    @ResponseBody
    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String orgfilename = request.getParameter("originFilename");
        String filename = request.getParameter("filename");
        String comePath = WebUtils.getRealPath(servletContext, "download");
        response.setCharacterEncoding("utf-8");

        File file = new File(comePath + File.separator + filename);
        response.setContentType("application/octet-stream");
        response.setContentLength((int)file.length());
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orgfilename, "UTF-8") + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        FileInputStream fis = null;
        ServletOutputStream out = response.getOutputStream();

        try {
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        } catch (Exception e) {
            throw e;
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (Exception var18) {
                }
            }

        }

        out.flush();
    }

    @RequestMapping(value = "/board/delete/{num}", method = RequestMethod.GET)
    public String baordDelete(@PathVariable String num) throws Exception {
        Map paramMap = new HashMap();
        List boardarray = new ArrayList();
        boardarray.add(num);
        paramMap.put("boardarray", boardarray);
        paramMap.put("tableName", "online");

        try {
            boardService.deleteBoard(paramMap);
        } catch (Exception e) {
        }

        return "redirect:/online-consult/1";
    }
}
