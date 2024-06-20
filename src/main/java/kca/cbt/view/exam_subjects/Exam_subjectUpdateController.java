package kca.cbt.view.exam_subjects;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.exam_subjects.Exam_subjectService;
import kca.cbt.exam_subjects.Exam_subjectVO;

@Controller
public class Exam_subjectUpdateController {

    @RequestMapping(value = "UpdateE.do")
    public String updateE(@RequestParam Map<String, String> paramMap, Exam_subjectVO exam_subjectVO) {
        Map<String, Exam_subjectVO> es = new HashMap<>();

        for (String key : paramMap.keySet()) {
            if (key.startsWith("es[")) {
                String memberId = key.substring(3, key.indexOf(']'));
                String field = key.substring(key.indexOf("].") + 2);

                Exam_subjectVO examSubject = es.getOrDefault(memberId, new Exam_subjectVO());
                examSubject.setMember_id(memberId);

                switch (field) {
                    case "subject_name":
                        examSubject.setSubject_name(paramMap.get(key));
                        break;
                    case "subject_code":
                        examSubject.setSubject_code(Integer.parseInt(paramMap.get(key)));
                        break;
                }

                es.put(memberId, examSubject);
            }
        }

        exam_subjectService.updateE(es);
        return "redirect:getEList.do"; // 업데이트 후 리스트 페이지로 리다이렉트
    }
}
