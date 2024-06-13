package kca.cbt.FAQ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kca.cbt.FAQ.impl.FAQDAO;

@Controller
public class DeleteFAQController {

    @Autowired
    private FAQDAO faqDAO; // FAQDAO 객체 주입

    @RequestMapping("/deleteFAQ.do")
    public String deleteFAQ(FAQVO vo, RedirectAttributes redirectAttributes) {
        faqDAO.deleteFAQ(vo.getSEQ_NUMBER()); // FAQ 삭제

        // 삭제 후 메시지를 Flash 속성으로 전달하여 다음 페이지에서 사용할 수 있도록 함
        redirectAttributes.addFlashAttribute("message", "FAQ가 삭제되었습니다.");

        return "redirect:/getFAQList.do"; // FAQ 삭제 후 FAQ 목록 페이지로 리다이렉트
    }
}
