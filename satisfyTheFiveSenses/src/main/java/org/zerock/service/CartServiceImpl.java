package org.zerock.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.zerock.dao.CartDAO;
import org.zerock.vo.BoardVO;
import org.zerock.vo.CartVO;
import org.zerock.vo.MemberVO;

@Service
public class CartServiceImpl implements CartService {
	
	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);

	@Inject
	private CartDAO dao;
	
	public void send(CartVO cartVO) throws Exception {
		dao.send(cartVO);
	}
	
	@Override
	public void regist(CartVO cartVO) throws Exception {
		dao.regist(cartVO);
	}
	
	@Override
	public void paymentComplete(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO tempVo = new MemberVO();
				
		tempVo = (MemberVO)session.getAttribute("member");
		
		String userId = tempVo.getUserId();
		
		cartVO.setUserId(userId);
		
		dao.paymentComplete(cartVO);
	}
	
	@Override
	public void confirmBuy(CartVO cartVO, HttpServletRequest request) throws Exception {

		int cno = Integer.parseInt(request.getParameter("cartNo"));
		
		cartVO.setCartNo(cno);
		
		dao.confirmBuy(cartVO);
	}

	@Override
	public void review(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		/*
		 * int cno = Integer.parseInt(request.getParameter("cartNo"));
		 * 
		 * cartVO.setCartNo(cno);
		 * 
		 * int pdno = Integer.parseInt(request.getParameter("pdNo"));
		 * 
		 * cartVO.setPdNo(pdno);
		 */
		
		dao.confirmBuy(cartVO);
		dao.review(cartVO);
	}

	@Override
	public void delete(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		int cno =  Integer.parseInt(request.getParameter("cartNo"));
		
		cartVO.setCartNo(cno);
		
		dao.delete(cartVO);
	}
	
	@Override
	public List<CartVO> list(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO tempVo = new MemberVO();
				
		tempVo = (MemberVO)session.getAttribute("member");
		
		String userId = tempVo.getUserId();
		
		cartVO.setUserId(userId);
		
		
		return dao.list(cartVO);
	}
	
	@Override
	public List<CartVO> stateList(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO tempVo = new MemberVO();
				
		tempVo = (MemberVO)session.getAttribute("member");
		
		String userId = tempVo.getUserId();
		
		cartVO.setUserId(userId);
		
		
		return dao.stateList(cartVO);
	}
	
	@Override
	public List<CartVO> manageStateList(CartVO cartVO, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberVO tempVo = new MemberVO();
				
		tempVo = (MemberVO)session.getAttribute("member");
		
		String userId = tempVo.getUserId();
		
		cartVO.setUserId(userId);
		
		
		return dao.manageStateList(cartVO);
	}
	
	

}
