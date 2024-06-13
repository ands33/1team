package kca.cbt.FAQ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.FAQ.impl.FAQDAO;

@Controller
public class UpdateFAQController {

    @Autowired
    private FAQDAO faqDAO; // FAQDAO 객체 주입

    @RequestMapping("/updateFAQ.do")
    public String updateFAQ(FAQVO vo) {
        faqDAO.updateFAQ(vo); // FAQ 정보 업데이트

        // FAQ 수정 후 FAQ 목록 페이지로 리다이렉트
        return "redirect:getFAQList.do";
    }
}
