package org.zerock.dao;

import java.util.List;

import org.zerock.vo.CartVO;

public interface CartDAO {
	

	public void send(CartVO cartVO) throws Exception;
	
	public void regist(CartVO cartVO) throws Exception;
	
	public void paymentComplete(CartVO cartVO) throws Exception;
	
	public void confirmBuy(CartVO cartVO) throws Exception;
	
	public void review(CartVO cartVO) throws Exception;
	
	public void delete(CartVO cartVO) throws Exception;
	
	public List<CartVO> list(CartVO cartVO) throws Exception;
	
	public List<CartVO> stateList(CartVO cartVO) throws Exception;
	
	public List<CartVO> manageStateList(CartVO cartVO) throws Exception;
	

}
