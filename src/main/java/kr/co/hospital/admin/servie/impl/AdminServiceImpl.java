package kr.co.hospital.admin.servie.impl;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.PagingVo;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    private BoardService boardService;

    public AdminServiceImpl(BoardService boardService) {
        this.boardService = boardService;
    }

    @Override
    public void listModule(String url,
                           Model model,
                           Map pageMap, int currentPage) throws Exception {
        Map<String, Object> tableMap = boardService.selectTable(url);

        PagingVo pagingVo = new PagingVo(10,
                currentPage,
                String.valueOf(tableMap.get("table_name")),
                String.valueOf(pageMap.get("search_text")),
                String.valueOf(pageMap.get("type")));

        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        model.addAttribute("url", url);
    }
}
