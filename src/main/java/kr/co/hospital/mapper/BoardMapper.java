package kr.co.hospital.mapper;

import kr.co.hospital.board.service.PagingVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface BoardMapper {
    List<Map> selectBoardList(PagingVo pagingVo) throws Exception;

    int selectBoardTotal(PagingVo pagingVo) throws Exception;
}
