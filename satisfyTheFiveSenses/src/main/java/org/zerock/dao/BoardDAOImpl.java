package org.zerock.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.vo.BoardVO;
import org.zerock.vo.Criteria;
import org.zerock.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
		
	
		@Override
		public void regist(BoardVO boardVO) throws Exception {
			sqlSession.insert("boardMapper.registCart", boardVO);
		}
	
		public void saveImage(Map<String, Object> hmap) throws SQLException {
			sqlSession.insert("boardMapper.saveImage",hmap);
		}
	
		// 게시글 작성
		@Override
		public void write(BoardVO boardVO) throws Exception {
			sqlSession.insert("boardMapper.insert", boardVO);
			
		}
		
		// 맛집 추천 게시글 작성
		@Override
		public void rWrite(BoardVO boardVO) throws Exception {
			sqlSession.insert("boardMapper.rInsert", boardVO);
		
		}
		
		// 맛집 추천 게시글 작성
		@Override
		public void pdRegist(BoardVO boardVO) throws Exception {
			sqlSession.insert("boardMapper.pdInsert", boardVO);
				
		}
		
		public List<BoardVO> listTemp(SearchCriteria scri) throws Exception {
			
			return sqlSession.selectList("boardMapper.listPageTemp", scri);
		}
		
		// 게시글 목록 조회
		@Override
		public List<BoardVO> list(SearchCriteria scri) throws Exception {
			
			return sqlSession.selectList("boardMapper.listPage", scri);
		}
		
		@Override
		public List<BoardVO> manageStockList() throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectList("boardMapper.manageStockList");
		}

		//게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.listCount", scri);
		}
		
		//Q&A게시글 목록 조회
		@Override
		public List<BoardVO> customerServiceList(Criteria cri) throws Exception {
			
			return sqlSession.selectList("boardMapper.customerServiceListPage", cri);
		}
		
		//Q&A게시글 총 갯수
		@Override
		public int customerServiceListCount() throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.customerServiceListCount");
		}

		

		@Override
		public BoardVO read(int boardNo) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.read", boardNo);
		}

		@Override
		public void update(BoardVO boardVO) throws Exception {

			sqlSession.update("boardMapper.update",boardVO);
			
		}

		@Override
		public void delete(BoardVO boardVO) throws Exception {

			sqlSession.delete("boardMapper.deletePd", boardVO);
			
		}
		
		@Override
		public BoardVO readRec(int bno) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.readRec", bno);
		}

		@Override
		public void updateRec(BoardVO boardVO) throws Exception {

			sqlSession.update("boardMapper.updateRec",boardVO);
			
		}

		@Override
		public void deleteRec(int bno) throws Exception {

			sqlSession.delete("boardMapper.deleteRec", bno);
			
		}
		
		// 게시글 목록 조회
		@Override
		public List<BoardVO> rList(SearchCriteria scri) throws Exception {
					
			return sqlSession.selectList("boardMapper.rListPage", scri);
		}
				
		//게시물 총 갯수
		@Override
		public int rListCount(SearchCriteria scri) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.rListCount", scri);
		}
		
		// 맛집추천 첨부파일 업로드
		@Override
		public void insertRecFile(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.insert("boardMapper.insertRecFile", map);
		}
		
		// 물품 심플이미지 업로드
		@Override
		public void insertSimpleImg(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.insert("boardMapper.insertSimpleImg", map);
		}
		
		// 맛집추천 첨부파일 다운
		@Override
		public Map<String, Object> selectRecFileInfo(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("boardMapper.selectRecFileInfo", map);
		}
		
	   	// 맛집추천 첨부파일 조회
		@Override
		public List<Map<String, Object>> selectRecFileList(int bno) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectList("boardMapper.selectRecFileList", bno);
		}
		
		@Override
		public void updateRecFile(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			
			sqlSession.update("boardMapper.updateRecFile", map);
		}

		@Override
		public void join(int bno) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.selectOne("boardMapper.join", bno);
		}
		
		
		
		
		
		

}
