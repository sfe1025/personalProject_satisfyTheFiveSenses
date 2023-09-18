package org.zerock.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.dao.BoardDAO;
import org.zerock.service.BoardService;
import org.zerock.vo.BoardVO;
import org.zerock.vo.Criteria;
import org.zerock.vo.PageMaker;
import org.zerock.vo.SearchCriteria;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	private BoardDAO dao;
	
	/**
	 * 파일처리 컨트롤러
	 * @param vo
	 * @return
	 */
		
	
		
	//관리자용 물품 등록뷰
	@RequestMapping(value = "/pdRegistView", method = RequestMethod.GET)
	public void pdRegistView() throws Exception{
		logger.info("product regist view");
					
	}
	
	//관리자용 물품 등록
	@RequestMapping(value = "/pdRegist", method = RequestMethod.POST)
	public String pdRegist(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("product regist");
			
		service.pdRegist(boardVO, mpRequest);
			
		return "redirect:/";
	}
	
	//상품 리스트뷰
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest req) throws Exception{
		logger.info("list");
		
		String userId = req.getParameter("userId");
		
		logger.info(userId);
		
		model.addAttribute("list", service.list(scri, req));
		
		return "board/list";
	}
	
	//재고관리뷰
	@RequestMapping(value = "/manageStockView", method = RequestMethod.GET)
	public String manageStockView(Model model) throws Exception{
		logger.info("manageStockView");
		
		model.addAttribute("list", service.manageStockList());
		
		return "board/manageStockView";
	}
	
	//Q&A 게시판
	@RequestMapping(value = "/customerService", method = RequestMethod.GET)
	public String customerService(Model model, Criteria cri) throws Exception{
		logger.info("customerService");
		
		model.addAttribute("list", service.customerServiceList(cri));
		
		
		 PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
		 pageMaker.setTotalCount(service.customerServiceListCount());
		 
		 model.addAttribute("pageMaker", pageMaker);
		
		/*
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri);
		 * pageMaker.setTotalCount(service.listCount(scri));
		 * 
		 * model.addAttribute("pageMaker", pageMaker);
		 */
		
		return "board/customerService";
	}
	
	//Q&A 게시판 작성뷰
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
			
	}
		
	//Q&A 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
			
		return "redirect:/board/customerService";
	}
	
	//Q&A 게시판 글 상세보기뷰
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, Model model) throws Exception{
		logger.info("readView");
		
		model.addAttribute("read", service.read(boardVO.getBoardNo()));
		
		return "board/readView";
	}

	//관리자용 상품삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, HttpServletRequest request) throws Exception{
		logger.info("delete");
			
		service.delete(boardVO, request);
		
		String Category = boardVO.getPdCategory();
			
		return "redirect:/board/list?pdCategory=" + Category;
	}
		
		// 李몄뿬�븯湲�
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String join(BoardVO boardVO) throws Exception{
			logger.info("join");
			
			service.join(boardVO.getBno());
			
			return "redirect:/board/list";
		}
		
		@RequestMapping(value="/fileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = service.selectRecFileInfo(map);
			String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
			String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
			// �뙆�씪�쓣 ���옣�뻽�뜕 �쐞移섏뿉�꽌 泥⑤��뙆�씪�쓣 �씫�뼱 byte[]�삎�떇�쑝濡� 蹂��솚�븳�떎.
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}
	
	
}