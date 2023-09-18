package org.zerock.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.vo.BoardVO;
import org.zerock.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	private SqlSession sqlSession;
	
		@Override
		public void send(CartVO cartVO) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.update("cartMapper.send", cartVO);
		}
		
		@Override
		public void regist(CartVO cartVO) throws Exception {
			sqlSession.insert("cartMapper.regist", cartVO);
		}
		
		@Override
		public void paymentComplete(CartVO cartVO) throws Exception {
			sqlSession.update("cartMapper.paymentComplete", cartVO);
		}
		
		@Override
		public void confirmBuy(CartVO cartVO) throws Exception {
			sqlSession.update("cartMapper.confirmBuy", cartVO);	
		}
		
		@Override
		public void review(CartVO cartVO) throws Exception {
			sqlSession.insert("cartMapper.review", cartVO);
		}

		@Override
		public void delete(CartVO cartVO) throws Exception {
			sqlSession.delete("cartMapper.delete", cartVO);
		}
		
		@Override
		public List<CartVO> list(CartVO cartVO) throws Exception {
			return sqlSession.selectList("cartMapper.list", cartVO);
		}
		
		@Override
		public List<CartVO> stateList(CartVO cartVO) throws Exception {
			return sqlSession.selectList("cartMapper.stateList", cartVO);
		}
		
		@Override
		public List<CartVO> manageStateList(CartVO cartVO) throws Exception {
			return sqlSession.selectList("cartMapper.manageStateList", cartVO);
		}
		
		
		
		
		
		

}
