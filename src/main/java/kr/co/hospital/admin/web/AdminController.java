package kr.co.hospital.admin.web;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.login.service.UserVo;
import kr.co.hospital.security.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private AdminService adminService;
    private BoardService boardService;
    private UserService userService;

    public AdminController(AdminService adminService, BoardService boardService, UserService userService) {
        this.adminService = adminService;
        this.boardService = boardService;
        this.userService = userService;
    }

    @RequestMapping("/login")
    public String root() {
        // userService.loadUserByUsername();
        return "admin/login";
    }

    @RequestMapping("/admin-login")
    public String adminLogin() {
        return "admin/login";
    }

    @RequestMapping("/notice/{currentPage}")
    public String notice(Model model,
                         @PathVariable int currentPage,
                         @RequestParam Map map) throws Exception {
        String url = "notice";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/notice-write", method = RequestMethod.GET)
    public String noticeWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "notice";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }

    @RequestMapping("/reserve/{currentPage}")
    public String reserve(Model model,
                         @PathVariable int currentPage,
                         @RequestParam Map map) throws Exception {
        String url = "reserve";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/reserve-write", method = RequestMethod.GET)
    public String reserveWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "reserve";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }

    @RequestMapping(value = "/reserve-view/{boardNum}", method = RequestMethod.GET)
    public String reserveView(Model model,
                              @PathVariable(value = "boardNum") int boardNum) throws Exception {
        PagingVo pagingVo = new PagingVo("reserve", boardNum);
        Map board = boardService.getBoardInfo(pagingVo);
        model.addAttribute("category", 4);
        model.addAttribute("urlName", "치료사례");
        model.addAttribute("board", board);
        return "admin/community/reserveView";
    }

    @RequestMapping("/online/{currentPage}")
    public String online(Model model,
                         @PathVariable int currentPage,
                         @RequestParam Map map) throws Exception {
        String url = "online";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/online-write", method = RequestMethod.GET)
    public String onlineWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "online";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }


    @RequestMapping(value = "answer-write", method = RequestMethod.POST)
    public String onlineWritePost(MultipartHttpServletRequest mRequest,
                                   Model model,
                                   @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo,
                                   BindingResult result,
                                   Authentication auth) throws Exception {

        if (result.hasErrors()) {
            return "admin/community/onlineWrite";
        }

        boardVo.setTableName("answer");
        UserVo userVo = (UserVo) auth.getPrincipal();
        boardVo.setId(userVo.getId());

        if (boardVo.getAnswer_num() != null) {
            boardService.updateAnswer(boardVo);
        } else {
            boardService.insertAnswer(boardVo);
        }

        boardVo.setTableName("online");
        boardVo.setContents(null);
        boardVo.setWriter(null);
        boardVo.setSubject(null);
        boardService.updateBoard(boardVo);

        model.addAttribute("category", 4);
        model.addAttribute("urlName", "온라인 상담");
        return "redirect:/admin/online/1";
    }


    @RequestMapping("/media/{currentPage}")
    public String media(Model model,
                        @PathVariable int currentPage,
                        @RequestParam Map map) throws Exception {
        String url = "media";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/media-write", method = RequestMethod.GET)
    public String mediaWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "media";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }

    @RequestMapping("/review/{currentPage}")
    public String review(Model model,
                        @PathVariable int currentPage,
                        @RequestParam Map map) throws Exception {
        String url = "review";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/review-write", method = RequestMethod.GET)
    public String reviewWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "review";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }

    @RequestMapping("/case/{currentPage}")
    public String casePage(Model model,
                        @PathVariable int currentPage,
                        @RequestParam Map map) throws Exception {
        String url = "case";
        adminService.listModule(url, model, map, currentPage);
        return "admin/community/" + url;
    }

    @RequestMapping(value = "/case-write", method = RequestMethod.GET)
    public String caseWrite(@RequestParam Map map, HttpServletRequest request, Model model, @ModelAttribute(value = "boardVo") BoardVo boardVo) throws Exception {
        String url = "case";
        adminService.writeModule(url, map, request, model);
        return "admin/community/" + url + "Write";
    }

    @RequestMapping(value = "/boardUpdate/{url}", method = RequestMethod.POST)
    public String boardUpdate(MultipartHttpServletRequest mRequest,
                              @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo,
                              BindingResult result,
                              @PathVariable String url,
                              @RequestParam Map map,
                              Authentication auth) throws Exception {
        if (result.hasErrors()) {
            return "admin/community/" + url + "Write";
        }

        String tableName = url;

        if ("case".equals(url)) {
            tableName = "treatment_case";
        }

        boardVo.setTableName(tableName);
        boardVo.setId(((UserVo)auth.getPrincipal()).getId());
        boardService.saveThumnail(mRequest, boardVo, url);
        boardService.saveMainThumnail(mRequest, boardVo, url);

        if (map.get("update").equals("modify")) {
            boardService.deleteFiles(map);
            boardService.updateBoard(boardVo);
        } else {
            boardService.insertBoard(boardVo);
        }

        boardService.saveFiles(mRequest, boardVo.getNum(), tableName);

        return "redirect:/admin/" + url + "/1";
    }

    @RequestMapping(value = "/getBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map getBoard(@RequestParam Map paramMap, HttpServletRequest request) throws Exception {
        return adminService.listModule(paramMap, request);
    }

    @RequestMapping(value = "/board/delete", method = RequestMethod.POST)
    @ResponseBody
    public Map baordDelete(@RequestParam Map paramMap, @RequestParam(required = false) List boardarray) throws Exception {
        Map result = new HashMap();
        paramMap.put("boardarray", boardarray);

        try {
            boardService.deleteBoard(paramMap);
            result.put("board_type", "delete");
        } catch (Exception e) {
            result.put("board_type", "");
        }

        return result;
    }

    @RequestMapping(value = "/newOrderChange", method = RequestMethod.POST)
    @ResponseBody
    public Map newOrderChange(@RequestParam Map paramMap) {
        Map result = new HashMap();

        try {
            boardService.newOrderChange(paramMap);
            result.put("num", 1);
            result.put("result", "success");
        } catch (Exception e) {
            result.put("result", "error");
        }

        return result;
    }

    @RequestMapping(value = "/main-view", method = RequestMethod.POST)
    @ResponseBody
    public Map mainView(@RequestParam Map paramMap) {
        Map result = new HashMap();

        try {
            BoardVo boardVo = new BoardVo();
            boardVo.setNum(Integer.parseInt(String.valueOf(paramMap.get("num"))));
            boardVo.setTableName(String.valueOf(paramMap.get("tableName")));
            boardVo.setMain_view(String.valueOf(paramMap.get("mainView")));

            boardService.updateBoard(boardVo);
            result.put("num", 1);
            result.put("result", "success");
        } catch (Exception e) {
            result.put("result", "error");
        }

        return result;
    }

}
