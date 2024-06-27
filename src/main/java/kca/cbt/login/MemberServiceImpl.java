package kca.cbt.login;

import java.sql.Date;
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

	public List<MemberVO> getMemberList(MemberVO vo) {
		return memberDAO.getMemberList(vo);
	}

	public void updateMember(Map<String, MemberVO> member) {
		memberDAO.updateMember(member);
	}

	public void updateMemberSubject(MemberVO vo) {
		memberDAO.updateMemberSubject(vo);
	}

	public void deleteMemberSubject(MemberVO vo) {
		memberDAO.deleteMemberSubject(vo);
	}

	// 특정 과목 코드와 출제위원 타입에 따른 출제위원 목록 조회
	public List<MemberVO> getMembersBySubjectAndType(int subjectCode, String memberType) {
		return memberDAO.getMembersBySubjectAndType(subjectCode, memberType);
	}

	public void updateMembersByPeriod(String startDate, String endDate) {
		memberDAO.updateMembersByPeriod(startDate, endDate);
		
	}

	@Override
	public void updateMembersByPeriod(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		
	}

}
