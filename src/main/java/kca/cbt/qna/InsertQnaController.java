package kca.cbt.qna;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InsertQnaController {
	@Autowired
    private QnaService qnaService;
	
	@RequestMapping("/insertQna.do")
	public String insertQna(QnaVO vo, QnaDAO qnaDAO) throws IOException{
		MultipartFile uploadFile = vo.getFile_data();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			String uploadPath = "C:/1kosmosc/sts/work_space3/upload/boarduploadfile/";
			uploadFile.transferTo(new File(uploadPath + fileName));
		}
		qnaDAO.insertQna(vo);
		return "qna.jsp";
	}
	

}
