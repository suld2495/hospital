package kr.co.hospital.admin.servie.impl;

import kr.co.hospital.admin.servie.AdminService;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.mapper.BoardMapper;
import kr.co.hospital.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    private BoardService boardService;

    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    private ServletContext servletContext;

    private final String path = "download";


    public AdminServiceImpl(BoardService boardService) {
        this.boardService = boardService;
    }

    @Override
    public void listModule(String url,
                           Model model,
                           Map pageMap, int currentPage) throws Exception {
        String tableName = url;

        if ("case".equals(url)) {
            tableName = "treatment_case";
        }

        PagingVo pagingVo = new PagingVo(10,
                currentPage,
                String.valueOf(tableName),
                String.valueOf(pageMap.get("search_text")),
                String.valueOf(pageMap.get("type")));

        model.addAttribute("list", boardService.getBoardList(pagingVo));
        model.addAttribute("paging", pagingVo);
        model.addAttribute("url", url);
        model.addAttribute("tableName", tableName);
    }

    @Override
    public Map listModule(Map paramMap, HttpServletRequest request) throws Exception {
        Map map = new HashMap();
        PagingVo pagingVo = new PagingVo(10,
                Integer.parseInt(paramMap.get("page").toString()),
                String.valueOf(paramMap.get("tableName")),
                String.valueOf(paramMap.get("search")),
                changeSearchType(String.valueOf(paramMap.get("searcharray"))));
        map.put("list", boardService.getBoardList(pagingVo));
        map.put("total", pagingVo.getTotal());
        map.put("uploadPath", path);
        return map;
    }

    private String changeSearchType(String text) {
        if ("board_subject".equals(text)) {
            return "title";
        } else if ("board_content".equals(text)) {
            return "contents";
        }

        return text;
    }

    @Override
    public void writeModule(String url, Map pageMap, HttpServletRequest request, Model model) throws Exception {
        int page = 1;
        if (pageMap.get("page") != null) {
            page = Integer.parseInt(pageMap.get("page").toString());
        }

        Map<String, Object> tableMap = boardService.selectTable(url);
        String tableName = tableMap.get("table_name").toString();
        model.addAttribute("tableName", tableName);
        model.addAttribute("update", request.getParameter("update"));
        if (request.getParameter("update").equals("modify")) {
            PagingVo pagingVo = new PagingVo(String.valueOf(tableName),
                    Integer.parseInt((String) pageMap.get("board_num")));

            model.addAttribute("success", "pass");
            Map map = boardService.getBoardInfo(pagingVo);

            if ("online".equals(url)) {
                PagingVo anserPagingVo = new PagingVo("answer", Integer.parseInt((String) pageMap.get("board_num")));
                Map answer = StringUtil.changeString(boardMapper.selectBoardInfo(anserPagingVo));

                if (answer != null) {
                    map.put("answer_num", answer.get("answer_num"));
                    map.put("answer_contents", answer.get("answer_contents"));
                }
            }

            model.addAttribute("board", map);
            model.addAttribute("appendixList", boardService.selectAppendix(pagingVo));
        }

        model.addAttribute("url", url);
        model.addAttribute("page", page);
    }
}
