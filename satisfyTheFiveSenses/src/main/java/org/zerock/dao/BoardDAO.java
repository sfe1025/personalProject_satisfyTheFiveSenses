package org.zerock.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.zerock.vo.BoardVO;
import org.zerock.vo.Criteria;
import org.zerock.vo.SearchCriteria;

public interface BoardDAO {
	
	
	//이미지 저장
	public void saveImage(Map<String, Object> hmap) throws SQLException;
	
	public void regist(BoardVO boardVO) throws Exception;
	
	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//맛집 추천 게시글 작성
	public void rWrite(BoardVO boardVO) throws Exception;
	
	//물품 등록
	public void pdRegist(BoardVO boardVO) throws Exception;
	/* public void pdRegist(BoardVO boardVO) throws Exception; */
	
	public List<BoardVO> listTemp(SearchCriteria scri) throws Exception;
	
	//게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	public List<BoardVO> manageStockList() throws Exception;
	
	//Q&A게시글 목록 조회
	public List<BoardVO> customerServiceList(Criteria cri) throws Exception;
	
	//Q&A게시글 총 갯수
	public int customerServiceListCount() throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int boardNo) throws Exception;
	
	//게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public void delete(BoardVO boardVO) throws Exception;
	
	//맛집추천 게시물 조회
	public BoardVO readRec(int bno) throws Exception;
		
	//맛집추천 게시물 수정
	public void updateRec(BoardVO boardVO) throws Exception;
		
	//맛집추천 게시물 삭제
	public void deleteRec(int bno) throws Exception;
	
	//게시물 목록 조회
	public List<BoardVO> rList(SearchCriteria scri) throws Exception;
		
	//게시물 총 갯수
	public int rListCount(SearchCriteria scri) throws Exception;
	
	//맛집추천 첨부파일 업로드
	public void insertRecFile(Map<String, Object> map) throws Exception;
	
	//물품 심플이미지 업로드
	public void insertSimpleImg(Map<String, Object> map) throws Exception;
	
	//맛집추천 첨부파일 다운
	public Map<String, Object> selectRecFileInfo(Map<String, Object> map) throws Exception;
	
	//맛집추천 첨부파일 조회
	public List<Map<String, Object>> selectRecFileList(int bno) throws Exception;
	
	//맛집추천 첨부파일 수정
	public void updateRecFile(Map<String, Object> map) throws Exception;
	
	//같이먹기 참여하기
	public void join(int bno) throws Exception;

}
