//package kca.cbt.notice;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import kca.cbt.notice.NoticeVO;
//import kca.cbt.notice.NoticeDAO;
//
//@Controller
//public class GetNoticeController {
//
//	@Autowired
//	private NoticeDAO noticeDAO;
//	
//	@RequestMapping("/getNotice.do")
//	public ModelAndView getNoticeList(NoticeVO vo, NoticeDAO noticeDAO, ModelAndView mav) {
//		mav.addObject("notice",NoticeDAO.getnotice(vo)); // Model 정보 저장
//		mav.setViewName("getNotice.jsp"); // View 정보 저장
//		return mav;
//	}
//}




package kca.cbt.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GetNoticeController {

    @Autowired
    private NoticeDAO noticeDAO; // NoticeDAO 인스턴스 주입

    @RequestMapping("/getNotice.do")
    public ModelAndView getNoticeList(NoticeVO vo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("notice", noticeDAO.getnotice(vo)); // 인스턴스를 통해 메서드 호출 (대소문자 수정)
        mav.setViewName("getNotice.jsp"); // View 정보 저장
        return mav;
    }
}

