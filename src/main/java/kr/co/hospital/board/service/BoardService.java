package kr.co.hospital.board.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface BoardService {
    List<Map> getBoardList(PagingVo pagingVo) throws Exception;

    Map getBoardInfo(PagingVo pagingVo) throws Exception;

    int insertBoard(BoardVo boardVo) throws Exception;

    void saveFile(MultipartHttpServletRequest mRequest, int num, String tableName) throws Exception;

    String saveFile(MultipartHttpServletRequest mRequest) throws Exception;

    Map<String, Object> selectTable(String url) throws Exception;
}
