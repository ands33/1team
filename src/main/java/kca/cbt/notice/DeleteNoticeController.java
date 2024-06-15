package kca.cbt.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kca.cbt.notice.NoticeVO;
import kca.cbt.notice.NoticeDAO;

@Controller
public class DeleteNoticeController  {
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(NoticeVO vo, NoticeDAO noticeDAO) {
		
		noticeDAO.deleteNotice(vo);
		return "getNoticeList.do";
	}

}