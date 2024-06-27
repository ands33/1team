package kca.cbt.view.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.login.MemberDAO;

@Controller
public class GetMembersByPeriodServlet {
    @RequestMapping(value = "updateMembersByPeriod.do")
    public String updateMembersByPeriod(@RequestParam("startDate") String startDate,
                                        @RequestParam("endDate") String endDate,
                                        MemberDAO memberDAO, Model model) {
        int updatedRows = memberDAO.updateMembersByPeriod(startDate, endDate);
        model.addAttribute("updatedRows", updatedRows);
        return "redirect:IndexMemberList.do"; // 목록으로 리다이렉트
    }
}