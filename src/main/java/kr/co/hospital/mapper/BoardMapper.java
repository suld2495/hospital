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
}
