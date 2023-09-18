package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.dao.MemberDAO;
import org.zerock.vo.BoardVO;
import org.zerock.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject MemberDAO dao;

	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
		
	}
	

	@Override
	public MemberVO searchId(MemberVO memberVO) throws Exception {
		return dao.searchId(memberVO);
	}
	
	@Override
	public MemberVO searchPw(MemberVO memberVO) throws Exception {
		return dao.searchPw(memberVO);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return dao.login(vo);
		
	}
	

	@Override
	public MemberVO mypageView(MemberVO vo) throws Exception {
		
		return dao.mypageView(vo);
	}


	@Override
	public void memberUpdate(MemberVO vo) throws Exception {

		dao.memberUpdate(vo);
		
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {

		dao.memberDelete(vo);
		
	}

	@Override
	public int passChk(MemberVO vo) throws Exception {
		
		int result = dao.passChk(vo);
		return result;
		
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		
		int result = dao.idChk(vo);
		return result;
		
	}
	
	
	
	
	

}
