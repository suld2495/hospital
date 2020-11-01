package kr.co.hospital.client.web;

import kr.co.hospital.board.service.BoardService;
import kr.co.hospital.client.service.ClientService;
import kr.co.hospital.popup.service.PopupService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ClientController {
    private ClientService clientService;
    private BoardService boardService;
    private PopupService popupService;

    public ClientController(ClientService clientService, BoardService boardService, PopupService popupService) {
        this.clientService = clientService;
        this.boardService = boardService;
        this.popupService = popupService;
    }

    @RequestMapping("/main")
    public String main(Model model) throws Exception {
        Map popupMap = new HashMap();
        popupMap.put("popupShow", "y");

        model.addAttribute("popup", popupService.selectPopup(popupMap));
        model.addAttribute("review", boardService.getMainReview());
        model.addAttribute("treatment", boardService.getMainCase());
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
        model.addAttribute("category", 1);
        model.addAttribute("urlName", "디지털 임플란트");
        return "/sub/implants/digitalImplants";
    }

    @RequestMapping("/navigation_implants")
    public String navigationImplants(Model model) {
        model.addAttribute("category", 1);
        model.addAttribute("urlName", "네비게이션 임플란트");
        return "/sub/implants/navigationImplants";
    }

    @RequestMapping("/oneday_implants")
    public String onedayImplants(Model model) {
        model.addAttribute("category", 1);
        model.addAttribute("urlName", "원데이 임플란트");
        return "/sub/implants/onedayImplants";
    }

    @RequestMapping("/bone_graft_implant")
    public String boneGraftImplant(Model model) {
        model.addAttribute("category", 1);
        model.addAttribute("urlName", "뼈이식 임플란트");
        return "/sub/implants/boneGraftImplant";
    }

    @RequestMapping("/full_implants")
    public String fullImplants(Model model) {
        model.addAttribute("category", 1);
        model.addAttribute("urlName", "전체 임플란트");
        return "/sub/implants/fullImplants";
    }

    @RequestMapping("/misowon_orthodontics")
    public String misowonRrthodontics(Model model) {
        model.addAttribute("category", 2);
        model.addAttribute("urlName", "미소원 치아교정");
        return "/sub/orthodontics/misowonOrthodontics";
    }

    @RequestMapping("/partial_orthodontics")
    public String partialOrthodontics(Model model) {
        model.addAttribute("category", 2);
        model.addAttribute("urlName", "부분교정");
        return "/sub/orthodontics/partialOrthodontics";
    }

    @RequestMapping("/malocculusion_orthodontics")
    public String malocculusionOrthodontics(Model model) {
        model.addAttribute("category", 2);
        model.addAttribute("urlName", "부정교합 교정");
        return "/sub/orthodontics/malocculusionOrthodontics";
    }

    @RequestMapping("/growth_reriod_orthodontics")
    public String growthReriodOrthodontics(Model model) {
        model.addAttribute("category", 2);
        model.addAttribute("urlName", "성장기 교정");
        return "/sub/orthodontics/growthReriodOrthodontics";
    }

    @RequestMapping("/general")
    public String general(Model model) {
        model.addAttribute("category", 3);
        model.addAttribute("urlName", "충치/치주/신경치료");
        return "/sub/tooth/general";
    }

    @RequestMapping("/aesthetic")
    public String aesthetic(Model model) {
        model.addAttribute("category", 9);
        model.addAttribute("urlName", "라미네이트");
        return "/sub/tooth/aesthetic";
    }

    @RequestMapping("/aesthetic-ceramic")
    public String aestheticAll(Model model) {
        model.addAttribute("category", 9);
        model.addAttribute("urlName", "올세라믹 크라운");
        return "/sub/tooth/aestheticAll";
    }

    @RequestMapping("/wisdom")
    public String wisdom(Model model) {
        model.addAttribute("category", 3);
        model.addAttribute("urlName", "사랑니 발치");
        return "/sub/tooth/wisdom";
    }

    @RequestMapping("/scaling")
    public String scaling(Model model) {
        model.addAttribute("category", 3);
        model.addAttribute("urlName", "스케일링");
        return "/sub/tooth/scaling";
    }

    @RequestMapping("/private-policy")
    public String privatePolicy(Model model) {
        model.addAttribute("category", 5);
        model.addAttribute("urlName", "개인정보취급방침");
        return "/sub/etc/privatePolicy";
    }


    @RequestMapping("/video-operations-management-guidelines")
    public String videoOperationsManagementGuidelines(Model model) {
        model.addAttribute("category", 5);
        model.addAttribute("urlName", "영상정보처리기기 운영관리지침");
        return "/sub/etc/video";
    }


    @RequestMapping("/terms")
    public String terms(Model model) {
        model.addAttribute("category", 5);
        model.addAttribute("urlName", "이용약관");
        return "/sub/etc/terms";
    }
}
