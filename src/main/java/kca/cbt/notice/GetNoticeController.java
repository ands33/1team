package kca.cbt.notice;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kca.cbt.notice.NoticeVO;
import kca.cbt.notice.NoticeDAO;

@Controller
public class GetNoticeController {

	@RequestMapping("/getNotice.do")
	public ModelAndView getNoticeList(NoticeVO vo, NoticeDAO boardDAO, ModelAndView mav) {
		mav.addObject("notice",NoticeDAO.getnotice(vo)); // Model 정보 저장
		mav.setViewName("getNotice.jsp"); // View 정보 저장
		return mav;
	}

}
