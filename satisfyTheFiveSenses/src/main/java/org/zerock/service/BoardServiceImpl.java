package org.zerock.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.controller.BoardController;
import org.zerock.dao.BoardDAO;
import org.zerock.util.FileUtils;
import org.zerock.vo.BoardVO;
import org.zerock.vo.Criteria;
import org.zerock.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	
	@Override
	public void regist(BoardVO boardVO) throws Exception {
		dao.regist(boardVO);
	}
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);

	}

	// 맛집 추천 게시글 작성
	@Override
	public void rWrite(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.rWrite(boardVO);

		List<Map<String, Object>> list = FileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			dao.insertRecFile(list.get(i));
		}
	}

	// 물품 등록
	@Override
	public void pdRegist(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		/* dao.pdRegist(boardVO); */

		MultipartFile mf = mpRequest.getFile("imgFile");
		@SuppressWarnings("deprecation")
		String path = mpRequest.getRealPath("resources/img");
		String fileName = mf.getOriginalFilename();
		File uploadFile = new File(path + "//" + fileName);
		
		logger.info(path);
		logger.info(fileName);
		
		try {
			mf.transferTo(uploadFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		boardVO.setImg(fileName);
		
		dao.pdRegist(boardVO);

		//sqlSession.insert("boardMapper.pdInsert", boardVO);

		/*
		 * try { Map<String, Object> hmap = new HashMap<String, Object>();
		 * hmap.put("pdNo", boardVO.getPdNo()); hmap.put("pdName", boardVO.getPdName());
		 * hmap.put("pdCategory", boardVO.getPdCategory()); hmap.put("pdSimple",
		 * boardVO.getPdSimple()); hmap.put("pdDetail", boardVO.getPdDetail());
		 * hmap.put("pdStock", boardVO.getPdStock()); hmap.put("pdPrice",
		 * boardVO.getPdPrice()); hmap.put("img", boardVO.getImgFile().getBytes());
		 * dao.pdRegist(hmap); dao.saveImage(hmap); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */

		/*
		 * List<Map<String,Object>> list = FileUtils.parseInsertFileInfo(boardVO,
		 * mpRequest); int size = list.size(); for(int i=0; i<size; i++){
		 * dao.insertSimpleImg(list.get(i)); }
		 */
	}

	@Override
	public Object list(SearchCriteria scri, HttpServletRequest req) throws Exception {
		// TODO Auto-generated method stub
		
		if(req.getParameter("pdName") != null) {
			
			String pdName = req.getParameter("pdName");
			
			scri.setPdName(pdName);
			
			return dao.listTemp(scri);
		} else {
		
		String pdCategory = req.getParameter("pdCategory");
		
		scri.setPdCategory(pdCategory);
		return dao.list(scri);
		}
	}

	@Override
	public List<BoardVO> manageStockList() throws Exception {
		// TODO Auto-generated method stub
		
		return dao.manageStockList();
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	@Override
	public List<BoardVO> customerServiceList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.customerServiceList(cri);
	}
	
	@Override
	public int customerServiceListCount() throws Exception{
		return dao.customerServiceListCount();
	}


	@Override
	public BoardVO read(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(boardNo);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {

		dao.update(boardVO);
	}

	@Override
	public void delete(BoardVO boardVO, HttpServletRequest request) throws Exception {

		int pdNo =  Integer.parseInt(request.getParameter("pdNo"));
		
		boardVO.setPdNo(pdNo);
		
		dao.delete(boardVO);
	}

	@Override
	public BoardVO readRec(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readRec(bno);
	}

	public void updateRec(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {

		dao.updateRec(boardVO);

		List<Map<String, Object>> list = FileUtils.parseUpdateFileInfo(boardVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			if (tempMap.get("IS_NEW").equals("Y")) {
				dao.insertRecFile(tempMap);
			} else {
				dao.updateRecFile(tempMap);
			}
		}
	}

	@Override
	public void deleteRec(int bno) throws Exception {

		dao.deleteRec(bno);
	}

	@Override
	public List<BoardVO> rList(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rList(scri);
	}

	@Override
	public int rListCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.rListCount(scri);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectRecFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectRecFileList(bno);
	}

	// 맛집추천첨부파일 다운로드
	@Override
	public Map<String, Object> selectRecFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectRecFileInfo(map);
	}

	@Override
	public void join(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.join(bno);
	}

}
