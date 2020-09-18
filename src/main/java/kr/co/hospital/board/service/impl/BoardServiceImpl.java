package kr.co.hospital.board.service.impl;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class BoardServiceImpl implements BoardService {
    private final String path = "download";
    private BoardMapper boardMapper;

    @Autowired
    private ServletContext servletContext;

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

    @Override
    public int insertBoard(BoardVo boardVo) throws Exception {
        return boardMapper.insertBoard(boardVo);
    }

    @Override
    public void saveFile(MultipartHttpServletRequest mRequest, int num, String tableName) throws Exception {
        MultipartFile mFile = mRequest.getFile("file");

        if (mFile.isEmpty()) {
            return;
        }

        String realFileName = mFile.getOriginalFilename();
        String realPath = WebUtils.getRealPath(servletContext, path);

        String extension = realFileName.substring(realFileName.lastIndexOf("."), realFileName.length());

        UUID uuid = UUID.randomUUID();
        String downloadFilename = uuid.toString() + extension;

        File pathFile = new File(realPath);

        if (!pathFile.exists()) {
            pathFile.mkdirs();
        }

        File file = new File(realPath + File.separator + downloadFilename);

        Map param = new HashMap();
        param.put("num", num);
        param.put("tableName", tableName);
        param.put("realFileName", realFileName);
        param.put("downloadFilename", downloadFilename);
        param.put("filePath", realPath);

        boardMapper.insertFile(param);

        try {
            mFile.transferTo(file);
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }

    @Override
    public String saveFile(MultipartHttpServletRequest mRequest) throws Exception {
        MultipartFile mFile = mRequest.getFile("file");

        String realFileName = mFile.getOriginalFilename();
        String realPath = WebUtils.getRealPath(servletContext, path);

        String extension = realFileName.substring(realFileName.lastIndexOf("."), realFileName.length());

        UUID uuid = UUID.randomUUID();
        String downloadFilename = uuid.toString() + extension;

        File pathFile = new File(realPath);

        if (!pathFile.exists()) {
            pathFile.mkdirs();
        }

        File file = new File(realPath + File.separator + downloadFilename);

        try {
            mFile.transferTo(file);
            return downloadFilename;
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }
}
