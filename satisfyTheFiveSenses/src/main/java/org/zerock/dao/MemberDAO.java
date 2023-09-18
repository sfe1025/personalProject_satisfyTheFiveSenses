package org.zerock.dao;

import org.zerock.vo.BoardVO;
import org.zerock.vo.MemberVO;

public interface MemberDAO {
	
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO searchId(MemberVO memberVO) throws Exception;
	
	public MemberVO searchPw(MemberVO memberVO) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//마이페이지
	public MemberVO mypageView(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	//패스워드 체크
	public int passChk(MemberVO vo) throws Exception;

	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
	
}
