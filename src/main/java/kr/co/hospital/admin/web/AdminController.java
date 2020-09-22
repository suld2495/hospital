package kr.co.hospital.admin.web;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.login.service.UserVo;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private AdminService adminService;
    private BoardService boardService;

    public AdminController(AdminService adminService, BoardService boardService) {
        this.adminService = adminService;
        this.boardService = boardService;
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

    @RequestMapping(value = "/boardUpdate/{url}", method = RequestMethod.POST)
    public String boardUpdate(MultipartHttpServletRequest mRequest,
                              @ModelAttribute(value = "boardVo") @Valid BoardVo boardVo,
                              BindingResult result,
                              @PathVariable String url,
                              Authentication auth) throws Exception {
        if (result.hasErrors()) {
            return "admin/community/" + url + "Write";
        }

        boardVo.setTableName(url);
        boardVo.setId((String) auth.getPrincipal());
        boardService.insertBoard(boardVo);
        boardService.saveFile(mRequest, boardVo.getNum(), url);

        return "redirect:/admin/" + url + "/1";
    }

    @RequestMapping(value = "/getBoard", method = RequestMethod.POST)
    @ResponseBody
    public Map getBoard(@RequestParam Map paramMap, HttpServletRequest request) throws Exception {
        return adminService.listModule(paramMap, request);
    }

}
