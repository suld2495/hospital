package kr.co.hospital.admin.servie;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface AdminService {
    void listModule(String url, Model model, Map map, int currentPage) throws Exception;

    Map listModule(Map paramMap, HttpServletRequest request) throws Exception;

    void writeModule(String url, Map map, HttpServletRequest request, Model model) throws Exception;
}
