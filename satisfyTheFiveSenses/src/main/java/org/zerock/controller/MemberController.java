package org.zerock.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.service.MemberService;
import org.zerock.vo.BoardVO;
import org.zerock.vo.MemberVO;


@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//비밀번호 재확인뷰
	@RequestMapping(value = "/AuthenticationView", method = RequestMethod.GET)
	public void AuthenticationView() throws Exception{
		logger.info("AuthenticationView");
		
	}
	
	// 회원가입 get
	@RequestMapping(value = "/registerView", method = RequestMethod.GET)
	public void registerView() throws Exception{
		logger.info("get register");
		
	}
	
	// 회원가입 post
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception{
		logger.info("post register");
		int result = service.idChk(vo);
		try {
			if( result == 1) {
				return "redirect:/";
			} else if(result == 0) {
				service.register(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/searchIdView", method = RequestMethod.GET)
	public void searchIdView() throws Exception{
		logger.info("searchIdView");
		
	}
	
	@RequestMapping(value = "/searchId", method = RequestMethod.POST)
	public String searchId(MemberVO memberVO, Model model) throws Exception{
		logger.info("searchId");
		
		MemberVO vo = service.searchId(memberVO);
		
		if(vo == null) {
			model.addAttribute("msg", "고객님의 이메일과 일치하는 아이디가 없습니다.");
		} else {
			String userId = vo.getUserId();
			model.addAttribute("msg", "고객님의 아이디는" + userId + "입니다.");
		}
		
		model.addAttribute("url","/");
		
			
		return "member/redirect";
	}
	
	@RequestMapping(value = "/searchPwView", method = RequestMethod.GET)
	public void searchPwView() throws Exception{
		logger.info("searchIdView");
		
	}
	
	@RequestMapping(value = "/searchPw", method = RequestMethod.POST)
	public String searchPw(MemberVO memberVO, Model model) throws Exception{
		logger.info("searchPw");
		
		MemberVO vo = service.searchPw(memberVO);
		
		if(vo == null) {
			model.addAttribute("msg", "고객님의 아이디 혹은 이메일을 다시한번 확인해주세요.");
		} else {
			String userPw = vo.getUserPw();
			model.addAttribute("msg", "고객님의 비밀번호는" + userPw + "입니다.");
		}
		
		model.addAttribute("url","/member/loginView");
		
			
		return "member/redirect";
	}
	
	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public void loginView() throws Exception{ logger.info("login");
	 
	 }
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		logger.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/mypageView", method = {RequestMethod.GET, RequestMethod.POST})
	public String mypageView(MemberVO vo, HttpSession session, HttpServletRequest req) throws Exception{
		
		/* service.mypageView(vo); */
		/*
		 * model.addAttribute("list", service.mypageView(vo));
		 */
		
		session = req.getSession();
		MemberVO mypage = service.mypageView(vo);
		
		session.setAttribute("mypage", mypage);
		
		return "member/mypageView";
		
	}
	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session, HttpServletRequest req) throws Exception{
		logger.info("member update");
		
		service.memberUpdate(vo);
		
		session = req.getSession();
		MemberVO login = service.login(vo);
		
			session.setAttribute("member", login);
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, HttpServletRequest req) throws Exception{
		logger.info("member delete");
		
		service.memberDelete(vo);
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	/*
	 * @RequestMapping(value = "/memberDelete", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String memberDelete(MemberVO vo, HttpSession
	 * session, RedirectAttributes rttr) throws Exception{
	 * logger.info("member delete");
	 * 
	 * MemberVO member = (MemberVO) session.getAttribute("member");
	 * 
	 * String sessionPw = member.getUserPw();
	 * 
	 * String voPw = vo.getUserPw();
	 * 
	 * logger.info(sessionPw); logger.info(voPw);
	 * 
	 * 
	 * if(!(sessionPw.equals(voPw))) { rttr.addFlashAttribute("msg", false); return
	 * "redirect:/member/memberUpdateView"; }
	 * 
	 * service.memberDelete(vo);
	 * 
	 * session.invalidate();
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */
	
	//패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		
		int result = service.passChk(vo);
		return result;
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		
		int result = service.idChk(vo);
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	public String mailCheckGET(String email) throws Exception{
		
		// 뷰(View)로부터 넘어온 데이터 확인
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + email);
		
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 " + checkNum);
		
		// 이메일 보내기
		String setFrom = "sfe1025@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content =
				"홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" +
				"인증 번호는 " + checkNum + "입니다." +
				"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
		
	}
	
	
	
	
}