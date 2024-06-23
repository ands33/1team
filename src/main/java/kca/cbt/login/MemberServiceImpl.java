package kca.cbt.login;

import java.util.List;
import java.util.Map;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
	
	public List<MemberVO> getMemberList(MemberVO vo){
		return memberDAO.getMemberList(vo);
	}
	
	public void updateMember(Map<String, MemberVO> member) {
		memberDAO.updateMember(member);
	}
	
	public void updateMemberSubject(MemberVO vo) {
		memberDAO.updateMemberSubject(vo);
	}

}
