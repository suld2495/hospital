package kr.co.hospital.mapper;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PopupMapper {
    List<Map> selectPopup(Map<String, Object> paramMap) throws Exception;

    int selectPopupTotal(Map<String, Object> paramMap) throws Exception;

    void insertPopup(Map<String, Object> paramMap) throws Exception;

    void updatePopup(Map<String, Object> paramMap) throws Exception;

    void deletePopup(Map<String, Object> paramMap) throws Exception;
}
