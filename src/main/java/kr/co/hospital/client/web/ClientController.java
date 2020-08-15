package kr.co.hospital.client.web;

import kr.co.hospital.client.service.ClientService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClientController {
    private ClientService clientService;

    public ClientController(ClientService clientService) {
        this.clientService = clientService;
    }

    @RequestMapping("/")
    public String main() {
        return "/main/main";
    }

    @RequestMapping("/intro")
    public String intro(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "본원소개");
        return "/sub/info/intro";
    }

    @RequestMapping("/staff")
    public String staff(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "의료진소개");
        return "/sub/info/staff";
    }

    @RequestMapping("/competitiveness")
    public String competitiveness(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "핵심경쟁력");
        return "/sub/info/competitiveness";
    }

    @RequestMapping("/diagnostic_equipment_system")
    public String diagnosticEquipmentSystem(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "진단장비 시스템");
        return "/sub/info/diagnosticEquipmentSystem";
    }

    @RequestMapping("/tour")
    public String tour(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "둘러보기");
        return "/sub/info/tour";
    }

    @RequestMapping("/directions")
    public String directions(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "오시는길");
        return "/sub/info/directions";
    }

    @RequestMapping("/medical")
    public String medical(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "진료보증제도");
        return "/sub/info/medical";
    }

    @RequestMapping("/digital_implants")
    public String digitalImplants(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "디지털 임플란트");
        return "/sub/implants/digitalImplants";
    }

    @RequestMapping("/navigation_implants")
    public String navigationImplants(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "네비게이션 임플란트");
        return "/sub/implants/navigationImplants";
    }

    @RequestMapping("/oneday_implants")
    public String onedayImplants(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "원데이 임플란트");
        return "/sub/implants/onedayImplants";
    }

    @RequestMapping("/bone_graft_implant")
    public String boneGraftImplant(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "뼈이식 임플란트");
        return "/sub/implants/boneGraftImplant";
    }

    @RequestMapping("/full_implants")
    public String fullImplants(Model model) {
        model.addAttribute("category", 0);
        model.addAttribute("urlName", "전체 임플란트");
        return "/sub/implants/fullImplants";
    }
}
