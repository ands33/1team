package kca.cbt.FAQ;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.FAQ.impl.FAQDAO;

@Controller
public class InsertFAQController {

    @RequestMapping("/insertFAQ.do")
    public String insertFAQ(FAQVO vo, FAQDAO faqDAO) {
        faqDAO.insertFAQ(vo);
        return "getFAQList.do"; // FAQ 추가 후 FAQ 목록 페이지로 리다이렉트
    }
}
