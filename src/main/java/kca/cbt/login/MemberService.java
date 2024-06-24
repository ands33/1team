package kca.cbt.login;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	// CRUE 기능의 메소드 구현
	public MemberVO getMember(MemberVO vo);
	
	List<MemberVO> getMemberList(MemberVO vo);
	
	public void updateMember(Map<String, MemberVO> member);
	
	public void updateMemberSubject(MemberVO vo);
	
	public void deleteMemberSubject(MemberVO vo);
	
	// 특정 과목 코드와 출제위원 타입에 따른 출제위원 목록 조회
	public List<MemberVO> getMembersBySubjectAndType(int subjectCode, String memberType);
}
