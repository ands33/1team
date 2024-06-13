package kca.cbt.FAQ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.FAQ.impl.FAQDAO;

@Controller
public class GetFAQController {

    @Autowired
    private FAQDAO faqDAO; // FAQDAO 객체 주입

    @RequestMapping("/getFAQ.do")
    public ModelAndView getFAQ(FAQVO vo) {
        ModelAndView mav = new ModelAndView();

        // FAQVO 객체를 사용하여 FAQ 정보를 데이터베이스에서 조회
        FAQVO faq = faqDAO.getFAQ(vo.getSEQ_NUMBER());

        mav.addObject("faq", faq); // Model 정보 저장
        mav.setViewName("getFAQ"); // View 정보 저장 (확장자 없음)

        return mav;
    }
}
