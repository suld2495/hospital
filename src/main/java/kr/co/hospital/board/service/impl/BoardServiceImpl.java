package kr.co.hospital.board.service.impl;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.board.service.BoardVo;
import kr.co.hospital.board.service.PagingVo;
import kr.co.hospital.mapper.BoardMapper;
import kr.co.hospital.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.*;

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

        for(Iterator<Map> it = list.iterator();it.hasNext();) {
            StringUtil.changeString(it.next());
        }

        int total = boardMapper.selectBoardTotal(pagingVo);
        pagingVo.makeLastPageNum(total);
        return list;
    }

    @Override
    public Map getBoardInfo(PagingVo pagingVo) throws Exception{
        if ("case".equals(pagingVo.getTableName())) {
            pagingVo.setTableName("treatment_case");
        }

        Map board = boardMapper.selectBoardInfo(pagingVo);

        StringUtil.changeString(board);

        if (board != null) {
            board.put("arrow", StringUtil.changeString(boardMapper.selectPrevNextNum(pagingVo)));
            board.put("appendix", selectAppendix(pagingVo));
        }

        return board;
    }

    @Override
    public int insertBoard(BoardVo boardVo) throws Exception {
        boardVo.setBoardOrder(boardMapper.getMaxBoardOrder(boardVo));
        return boardMapper.insertBoard(boardVo);
    }

    @Override
    public void insertAnswer(BoardVo boardVo) throws Exception {
        boardMapper.insertAnswer(boardVo);
    }

    @Override
    public void updateAnswer(BoardVo boardVo) throws Exception {
        boardMapper.updateAnswer(boardVo);
    }

    @Override
    public void saveFile(MultipartHttpServletRequest mRequest, int num, String tableName) throws Exception {
        MultipartFile mFile = mRequest.getFile("file");

        if (mFile == null || mFile.isEmpty()) {
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
        param.put("filePath", "/" + path + "/");

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

        return saveFile(mFile, null);
    }

    private String saveFile(MultipartFile mFile, Map param) throws Exception {
        if (mFile == null || mFile.isEmpty()) {
            return "";
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

        try {
            mFile.transferTo(file);

            if (param != null) {
                param.put("realFileName", realFileName);
                param.put("downloadFilename", downloadFilename);
                param.put("filePath", "/" + path + "/");
                boardMapper.insertFile(param);
            }

            return downloadFilename;
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }

    @Override
    public Map<String, Object> selectTable(String url) throws Exception {
        return StringUtil.changeString(boardMapper.selectTable(url));
    }

    @Override
    public List<Map> selectAppendix(PagingVo pagingVo) throws Exception {
        List<Map> list = boardMapper.selectAppendix(pagingVo);

        for (Iterator<Map> it = list.iterator(); it.hasNext();) {
            StringUtil.changeString(it.next());
        }

        return list;
    }

    @Override
    public void deleteBoard(Map paramMap) throws Exception {
        boardMapper.deleteBoard(paramMap);
    }

    @Override
    public void saveThumnail(MultipartHttpServletRequest mRequest, BoardVo boardVo, String url) throws Exception {
        MultipartFile mFile = mRequest.getFile("thumnail_img");

        if (mFile == null || mFile.isEmpty()) {
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

        try {
            mFile.transferTo(file);
            boardVo.setReal_thumnail(realFileName);
            boardVo.setThumnail(downloadFilename);
            boardVo.setThumnail_path("/" + path + "/");
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }

    @Override
    public void saveFiles(MultipartHttpServletRequest mRequest, int num, String url) throws Exception {
        Iterator<String> it = mRequest.getFileNames();
        String key = null;
        MultipartFile mFile;

        while (it.hasNext()) {
            key = it.next();

            if ("thumnail_img".equals(key) || "main_thumnail_img".equals(key)) {
                continue;
            }

            mFile = mRequest.getFile(key);

            try {
                Map param = new HashMap();
                param.put("num", num);
                param.put("tableName", url);
                saveFile(mFile, param);
            } catch (Exception e) {
                throw e;
            }
        }
    }

    @Override
    public void newOrderChange(Map paramMap) throws Exception {
        String json = (String)paramMap.get("order");
        json = json.replaceAll("&quot;", "\"");
        if (!json.equals("") && json != null) {
            String[] array = json.split("},");

            for(int i = 0; i < array.length - 1; ++i) {
                array[i] = array[i] + "}";
            }

            JsonParser parser = new JsonParser();

            for(int i = 0; i < array.length; ++i) {
                Object obj = parser.parse(array[i]);
                JsonObject jsonObject = (JsonObject)obj;
                Map<String, Object> inserMap = new HashMap();
                inserMap.put("board_order", jsonObject.get("order").getAsString());
                inserMap.put("num", jsonObject.get("board_num").getAsString());
                inserMap.put("tableName", paramMap.get("tableName"));
                boardMapper.boardModify(inserMap);
            }
        }
    }

    @Override
    public void updateBoard(BoardVo boardVo) throws Exception {
        boardMapper.updateBoard(boardVo);
    }

    @Override
    public void deleteFiles(Map map) throws Exception {
        int count = 1;

        while (map.containsKey("before" + count)) {
            String type = (String) map.get("type" + count);
            int attachCode = Integer.parseInt((String) map.get("before" + count));

            if ("delete".equals(type)) {
                boardMapper.deleteAppendix(attachCode);
            }

            count++;
        }
    }

    @Override
    public void saveMainThumnail(MultipartHttpServletRequest mRequest, BoardVo boardVo, String url) throws Exception {
        MultipartFile mFile = mRequest.getFile("main_thumnail_img");

        if (mFile == null || mFile.isEmpty()) {
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

        try {
            mFile.transferTo(file);
            boardVo.setMain_thumnail(downloadFilename);
            boardVo.setReal_main_thumnail_img(realFileName);
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }

    @Override
    public List<Map> getMainReview() throws Exception {
        List<Map> list = boardMapper.selectMainReview();

        for(Iterator<Map> it = list.iterator(); it.hasNext();) {
            StringUtil.changeString(it.next());
        }

        return list;
    }

    @Override
    public List<Map> getMainCase() throws Exception {
        List<Map> list = boardMapper.selectMainCase();

        for(Iterator<Map> it = list.iterator(); it.hasNext();) {
            StringUtil.changeString(it.next());
        }

        return list;
    }

}
