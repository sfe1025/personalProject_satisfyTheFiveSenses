package org.zerock.service;

import org.zerock.vo.MemberVO;

public interface MemberService {
	
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO mypageView(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;

	public void memberDelete(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public MemberVO searchId(MemberVO memberVO) throws Exception;
	
	public MemberVO searchPw(MemberVO memberVO) throws Exception;
	
}
