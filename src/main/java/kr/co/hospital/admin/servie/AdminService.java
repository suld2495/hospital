package kr.co.hospital.admin.servie;

import org.springframework.ui.Model;

import java.util.Map;

public interface AdminService {
    void listModule(String url, Model model, Map map, int currentPage) throws Exception;
}
