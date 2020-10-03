package kr.co.hospital.board.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;

public interface BoardService {
    List<Map> getBoardList(PagingVo pagingVo) throws Exception;

    Map getBoardInfo(PagingVo pagingVo) throws Exception;

    int insertBoard(BoardVo boardVo) throws Exception;

    void saveFile(MultipartHttpServletRequest mRequest, int num, String tableName) throws Exception;

    String saveFile(MultipartHttpServletRequest mRequest) throws Exception;

    Map<String, Object> selectTable(String url) throws Exception;

    List<Map> selectAppendix(PagingVo pagingVo) throws Exception;

    void deleteBoard(Map paramMap) throws Exception;

    void saveThumnail(MultipartHttpServletRequest mRequest, BoardVo boardVo, String url) throws FileNotFoundException, Exception;

    void saveFiles(MultipartHttpServletRequest mRequest, int num, String url) throws Exception;

    void newOrderChange(Map paramMap) throws Exception;

    void updateBoard(BoardVo boardVo) throws Exception;

    void deleteFiles(Map map) throws Exception;
}
