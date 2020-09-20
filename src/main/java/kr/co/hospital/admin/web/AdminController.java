package kr.co.hospital.admin.web;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
