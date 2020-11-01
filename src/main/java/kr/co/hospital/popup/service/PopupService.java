package kr.co.hospital.popup.service;

import org.springframework.web.multipart.MultipartRequest;

import java.util.List;
import java.util.Map;

public interface PopupService {
    List<Map> selectPopup(Map<String, Object> paramMap) throws Exception;

    int selectPopupTotal(Map<String, Object> paramMap) throws Exception;

    void insertPopup(Map<String, Object> paramMap) throws Exception;

    void updatePopup(Map<String, Object> paramMap) throws Exception;

    void saveFile(MultipartRequest mRequest, Map<String, Object> paramMap) throws Exception;

    void deletePopup(Map<String, Object> paramMap) throws Exception;
}
