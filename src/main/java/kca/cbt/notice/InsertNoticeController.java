package kca.cbt.notice;

import java.io.File;
import java.io.IOException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kca.cbt.notice.NoticeVO;
import kca.cbt.notice.NoticeDAO;

public class InsertNoticeController {
	@RequestMapping("/insertBoard.do")
	public String insertBoard(NoticeVO vo, NoticeDAO noticeDAO) throws IOException{
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			// new File("D:/example.txt")는 File 객체를 생성하여 해당 경로를 참조하도록 합니다
			String uploadPath = "C:/1kosmosc/sts/work_space3/upload/boarduploadfile/";
            // 파일 업로드
            uploadFile.transferTo(new File(uploadPath + fileName));
            
//            vo.setUploadFile();
			
		}
		noticeDAO.insertNotice(vo);
		return "getBoardList.do";
	}
	

}
