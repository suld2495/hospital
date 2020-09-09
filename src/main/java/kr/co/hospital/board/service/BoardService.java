package kr.co.hospital.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
    List<Map> getBoardList(PagingVo pagingVo) throws Exception;

    Map getBoardInfo(PagingVo pagingVo) throws Exception;
}
