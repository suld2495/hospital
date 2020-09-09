package kr.co.hospital.board.service.impl;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    private BoardMapper boardMapper;

    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public List<Map> getBoardList(PagingVo pagingVo) throws Exception {
        List<Map> list = boardMapper.selectBoardList(pagingVo);
        int total = boardMapper.selectBoardTotal(pagingVo);
        pagingVo.makeLastPageNum(total);
        return list;
    }

    @Override
    public Map getBoardInfo(PagingVo pagingVo) throws Exception{
        Map board = boardMapper.selectBoardInfo(pagingVo);
        board.put("arrow", boardMapper.selectPrevNextNum(pagingVo));
        return board;
    }
}
