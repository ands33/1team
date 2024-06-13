package kca.cbt.qna;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class InsertQnaController {
    @RequestMapping(value="/insertQna.do")
    public String insertQna(QnaVO vo, QnaDAO qnaDAO) throws IOException {
        MultipartFile uploadFile = vo.getFile_data();
        if (!uploadFile.isEmpty()) {
            String fileName = uploadFile.getOriginalFilename();
            String uploadPath = "C:/1kosmosc/sts/work_space3/upload/boarduploadfile/";
            uploadFile.transferTo(new File(uploadPath + fileName));
            vo.setFile_data(uploadFile); // 파일 이름을 VO에 설정
        }
        qnaDAO.insertQna(vo);
        return "qna/qna.jsp"; // 적절한 리다이렉트 URL 설정
    }
}
