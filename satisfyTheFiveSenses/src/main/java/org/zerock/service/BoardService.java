package org.zerock.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.vo.BoardVO;
import org.zerock.vo.Criteria;
import org.zerock.vo.SearchCriteria;

public interface BoardService {
	
	public void regist(BoardVO boardVO) throws Exception;
	
	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//맛집 추천 게시글 작성
	public void rWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void pdRegist(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	//게시물 목록 조회
	public Object list(SearchCriteria scri, HttpServletRequest req) throws Exception;
	
	public List<BoardVO> manageStockList() throws Exception;
	
	//Q&A게시글 목록 조회
	public List<BoardVO> customerServiceList(Criteria cri) throws Exception;
	
	//Q&A게시글 총 갯수
	public int customerServiceListCount() throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	
	
	//게시물 조회
	public BoardVO read(int boardNo) throws Exception;
	
	//게시물 수정
	public void update(BoardVO boardVO) throws Exception;
		
	// 게시물 삭제
	public void delete(BoardVO boardVO, HttpServletRequest request) throws Exception;
	
	//게시물 조회
	public BoardVO readRec(int bno) throws Exception;
		
	//게시물 수정
	public void updateRec(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception;
			
	// 게시물 삭제
	public void deleteRec(int bno) throws Exception;
	
	//게시물 목록 조회
	public List<BoardVO> rList(SearchCriteria scri) throws Exception;
		
	//게시물 총 갯수
	public int rListCount(SearchCriteria scri) throws Exception;
	
	// 맛집추천 첨부파일 조회
	public List<Map<String, Object>> selectRecFileList(int bno) throws Exception;
	
	// 맛집추천 첨부파일 다운
	public Map<String, Object> selectRecFileInfo(Map<String, Object> map) throws Exception;
	
	
	
	//같이먹기 참여하기
	public void join(int bno) throws Exception;

}
