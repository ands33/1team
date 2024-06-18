package kca.cbt.view.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kca.cbt.login.MemberDAO;
import kca.cbt.login.MemberVO;

@Controller
public class UpdateMemberController {

    @RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
    public String updateMembers(@RequestParam Map<String, String> paramMap, MemberDAO memberDAO) {
        Map<String, MemberVO> members = new HashMap<>();

        for (String key : paramMap.keySet()) {
            if (key.startsWith("members[")) {
                String memberId = key.substring(8, key.indexOf(']'));
                String field = key.substring(key.indexOf("].") + 2);

                MemberVO member = members.getOrDefault(memberId, new MemberVO());
                member.setMember_id(memberId);

                switch (field) {
                    case "pw":
                        member.setPw(paramMap.get(key));
                        break;
                    case "member_name":
                        member.setMember_name(paramMap.get(key));
                        break;
                    case "member_type":
                        member.setMember_type(paramMap.get(key));
                        break;
                }

                members.put(memberId, member);
            }
        }

        memberDAO.updateMember(members);
        return "redirect:getMemberList.do";
    }

}
