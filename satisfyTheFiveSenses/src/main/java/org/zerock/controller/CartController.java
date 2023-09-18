package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.service.CartService;
import org.zerock.vo.BoardVO;
import org.zerock.vo.CartVO;
import org.zerock.vo.SearchCriteria;

@Controller
@RequestMapping("/cart")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Inject
	CartService service;
	
	@RequestMapping(value = "/popup", method = RequestMethod.GET)
	public void popup() throws Exception{
		logger.info("popup");
		
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(HttpServletRequest request, CartVO cartVO) throws Exception{
		logger.info("regist");
		
		String pdCategory = request.getParameter("pdCategory");
		service.regist(cartVO);
		
		return "redirect:/board/list?pdCategory=" + pdCategory;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("cartVO") CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("list");
		
		String userId = request.getParameter("userId");
		
		logger.info(userId);
		
		model.addAttribute("list", service.list(cartVO, request));
		
		return "cart/list";
	}
	
	@RequestMapping(value = "/paymentComplete", method = RequestMethod.POST)
	public String paymentComplete(CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("payment");
			
		service.paymentComplete(cartVO, request);
			
		return "redirect:/";
	}
	
	@RequestMapping(value = "/stateView", method = RequestMethod.GET)
	public String stateView(Model model, CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("stateView");
			
		model.addAttribute("list", service.stateList(cartVO, request));
			
		return "cart/stateView";
	}
	
	@RequestMapping(value = "/manageStateView", method = RequestMethod.GET)
	public void manageStateView(Model model, CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("manageStateView");
		
		model.addAttribute("list", service.manageStateList(cartVO, request));
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("delete");
			
		service.delete(cartVO, request);
			
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public String send(CartVO cartVO) throws Exception{
		logger.info("send");
		
		service.send(cartVO);
		
		return "redirect:/cart/manageStateView";
	}
	
	@RequestMapping(value = "/confirmBuy", method = RequestMethod.POST)
	public String confirmBuy(CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("send");
		
		service.confirmBuy(cartVO, request);
		
		return "redirect:/cart/stateView";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.POST)
	public String review(CartVO cartVO, HttpServletRequest request) throws Exception{
		logger.info("send");
		
		service.review(cartVO, request);
		
		return "redirect:/cart/stateView";
	}
	
	@RequestMapping(value = "/NewFile", method = RequestMethod.GET)
	public void eee() throws Exception{
		
	}
	
	
}