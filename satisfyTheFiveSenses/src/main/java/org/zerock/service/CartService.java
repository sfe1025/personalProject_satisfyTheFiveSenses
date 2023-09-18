package org.zerock.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.zerock.vo.CartVO;

public interface CartService {
	
	public void send(CartVO cartVO) throws Exception;
	
	public void regist(CartVO cartVO) throws Exception;
	
	public void confirmBuy(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public void review(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public void paymentComplete(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public void delete(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public List<CartVO> list(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public List<CartVO> stateList(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	public List<CartVO> manageStateList(CartVO cartVO, HttpServletRequest request) throws Exception;
	
	
}
