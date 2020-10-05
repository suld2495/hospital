package kr.co.hospital.mapper;

import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.PagingVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BoardMapper {
    List<Map> selectBoardList(PagingVo pagingVo) throws Exception;

    int selectBoardTotal(PagingVo pagingVo) throws Exception;

    Map selectBoardInfo(PagingVo pagingVo) throws Exception;

    Map selectPrevNextNum(PagingVo pagingVo) throws Exception;

    int insertBoard(BoardVo boardVo) throws Exception;

    void insertFile(Map param) throws Exception;

    Map<String, Object> selectTable(String url) throws Exception;

    List<Map> selectAppendix(PagingVo pagingVo) throws Exception;

    void deleteBoard(Map paramMap) throws Exception;

    void boardModify(Map<String, Object> inserMap) throws Exception;

    int getMaxBoardOrder(BoardVo tableName) throws Exception;

    void updateBoard(BoardVo boardVo) throws Exception;

    void deleteAppendix(int attachCode) throws Exception;

    List<Map> selectMainReview() throws Exception;

    List<Map> selectMainCase() throws Exception;
}
