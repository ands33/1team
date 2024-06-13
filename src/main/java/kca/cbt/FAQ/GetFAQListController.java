package kca.cbt.FAQ;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GetFAQListController {

    @RequestMapping("/getFAQList.do")
    public ModelAndView getFAQList(FAQVO faqDAO, ModelAndView mav) {
        mav.addObject("faqList", faqDAO.getFAQList()); // Model 정보 저장
        mav.setViewName("getFAQList.jsp"); // View 정보 저장
        return mav;
    }
}
