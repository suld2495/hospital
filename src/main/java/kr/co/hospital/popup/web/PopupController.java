package kr.co.hospital.popup.web;

import kr.co.hospital.popup.service.PopupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class PopupController {

    @Autowired
    private PopupService popupService;


    @RequestMapping("/popup/{currentPage}")
    public String popup(@PathVariable int currentPage, Model model) throws Exception {
        int totalPage = 10;
        int boardList = 10;
        String tableName = "popup";

        Map<String, Object> paramMap = new HashMap();
        paramMap.put("start", (currentPage - 1) * boardList);
        paramMap.put("end", boardList);
        paramMap.put("tableName", tableName);

        model.addAttribute("list", popupService.selectPopup(paramMap));
        model.addAttribute("total", popupService.selectPopupTotal(paramMap));
        model.addAttribute("boardList", boardList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("tableName", tableName);
        model.addAttribute("page", currentPage);
        return "admin/popup/popup";
    }

    @RequestMapping(value = "popupWrite", method = RequestMethod.GET)
    public String popupWrite(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
        if (paramMap.get("update") != null && paramMap.get("update").equals("update")) {
            paramMap.put("start", 0);
            paramMap.put("end", 1);
            model.addAttribute("list", popupService.selectPopup(paramMap));
        }

        model.addAttribute("update", paramMap.get("update"));
        return "admin/popup/popupWrite";
    }

    @RequestMapping(value = "popupWrite", method = RequestMethod.POST)
    public String popupWritePOST(MultipartRequest mRequest, @RequestParam Map<String, Object> paramMap) throws Exception {
        if (paramMap.get("update") != null) {
            popupService.saveFile(mRequest, paramMap);

            if (paramMap.get("update").equals("write")) {
                popupService.insertPopup(paramMap);
            } else if (paramMap.get("update").equals("update")) {
                popupService.updatePopup(paramMap);
            }
        }

        return "redirect:/admin/popup/1";
    }

    @ResponseBody
    @RequestMapping(value = "popupUpdateAjax")
    public Map popupUpdateAjax(@RequestParam Map<String, Object> paramMap, @RequestParam(required = false) List popup_array) throws Exception {
        if (paramMap.get("update") != null) {
            if (paramMap.get("update").equals("write")) {
                popupService.insertPopup(paramMap);
            } else if (paramMap.get("update").equals("update")) {
                if (popup_array != null) {
                    paramMap.put("popup_array", popup_array);
                }

                if ("n".equals(paramMap.get("popup_use"))) {
                    popupService.deletePopup(paramMap);
                } else {
                    popupService.updatePopup(paramMap);
                }
            }
        }

        HashMap<String, Object> hashMap = new HashMap();
        hashMap.put("num", 1);

        return hashMap;
    }
}
