package kr.co.hospital.popup.service.impl;

import kr.co.hospital.mapper.PopupMapper;
import kr.co.hospital.popup.service.PopupService;
import kr.co.hospital.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class PopupServiceImpl implements PopupService {
    private final String path = "popup";

    @Autowired
    private PopupMapper popupMapper;

    @Autowired
    private ServletContext servletContext;

    @Override
    public List<Map> selectPopup(Map<String, Object> paramMap) throws Exception {
        List<Map> list = popupMapper.selectPopup(paramMap);

        for (Iterator<Map> it = list.iterator(); it.hasNext();) {
            StringUtil.changeString(it.next());
        }

        return list;
    }

    @Override
    public int selectPopupTotal(Map<String, Object> paramMap) throws Exception {
        return popupMapper.selectPopupTotal(paramMap);
    }

    @Override
    public void insertPopup(Map<String, Object> paramMap) throws Exception {
        popupMapper.insertPopup(paramMap);
    }

    @Override
    public void updatePopup(Map<String, Object> paramMap) throws Exception {
        popupMapper.updatePopup(paramMap);
    }

    @Override
    public void saveFile(MultipartRequest mRequest, Map<String, Object> paramMap) throws Exception {
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

        paramMap.put("popup_img", downloadFilename);
        paramMap.put("popup_root", "/" + path + "/");

        try {
            mFile.transferTo(file);
        } catch (IllegalStateException e) {
            throw e;
        } catch (IOException e) {
            throw e;
        }
    }

    @Override
    public void deletePopup(Map<String, Object> paramMap) throws Exception {
        popupMapper.deletePopup(paramMap);
    }
}
