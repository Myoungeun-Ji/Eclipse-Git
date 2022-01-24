package com.human.edu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
//	@RequestMapping("/login")
//	public String login(Model m) {
//		m.addAttribute("userid","xaexal"); //let userid="xaexal";
//		m.addAttribute("passcode","human123");  //let passcode="human123";
//	   
//	   return "login";
//	}
	
	//위에거를 다르게 표현 (똑같음)
//	@RequestMapping("/login")
//	public ModelAndView login() {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("userid","xaexal"); //let userid="xaexal";
//		mv.addObject("passcode","human123");  //let passcode="human123";
//		mv.setViewName("login");
//	   return mv;
//	}
	@RequestMapping("/login")
	public String login() {
		
	   return "login";
	}
	
//	@RequestMapping("/doLogin")
//	public String doLogin(HttpServletRequest hsr, Model model) { //hsr에다가 값 저장
//		String userid=hsr.getParameter("userid");
//		String passcode=hsr.getParameter("passcode");
//		model.addAttribute("id",userid);
//		model.addAttribute("pw",passcode);
//		return "afterLogin";
//	}
	@RequestMapping("/doLogin")
	public String doLogin(HttpServletRequest hsr, Model model) { 
		String userid=hsr.getParameter("userid");
		if(userid.equals("")) {
			return "login";
		} else {
			model.addAttribute("id",userid);
			return "home";
		}
	}
	
	@RequestMapping("/signon")
	public String signon() {
		return "signon";
	}
	
	@RequestMapping("/signon_check")
	public String signon_check(HttpServletRequest hsr, Model model) {
		String name=hsr.getParameter("name");
		if(name.equals("")) {
			return "signon";
		} else {
			return "login";
		}
	}
	
	//같은의미 (한줄 코딩 덜할수있음)
//	@RequestMapping("/signon_check")
//	public String signon_check(@RequestParam("name") String name, Model model) {
//		if(name.equals("")) {
//			return "signon";
//		} else {
//			return "login";
//		}
//	}
	@RequestMapping("/homepage")
	public String homepage() { 
		
		return "homepage";
	}
	
	@RequestMapping("/logout")
	public String logout() { //id값 안넣어준채로 가니까 <c:if test="${id==null}">검사해서 빈칸이니까 home으로 돌아감
		return "home";
	}
//	@RequestMapping("/login1")
//	public String login1(HttpServletRequest log, Model model) { 
//		String uid=log.getParameter("userid");
//		String pc=log.getParameter("passcode");
//		model.addAttribute("userid",uid);
//		model.addAttribute("passcode",pc);
//		return "login1";
//	}
	
//	@RequestMapping("/signon")
//	public String signon(HttpServletRequest sign, Model model) {
//		String realname=sign.getParameter("realname");
//		String male=sign.getParameter("male");
//		String female=sign.getParameter("female");
//		String userid=sign.getParameter("userid");
//		String passcode=sign.getParameter("passcode");
//		String int1=sign.getParameter("politics");
//		String int2=sign.getParameter("ecnomics");
//		String int3=sign.getParameter("social");
//		String int4=sign.getParameter("culture");
//		String int5=sign.getParameter("arts");
//		String int6=sign.getParameter("entertainments");
//		String int7=sign.getParameter("history");
//		String int8=sign.getParameter("sports");
//		String int9=sign.getParameter("etc");
//		
//		model.addAttribute("realname",realname);
//		model.addAttribute("male",male);
//		model.addAttribute("female",female);
//		model.addAttribute("userid",userid);
//		model.addAttribute("passcode",passcode);
//		model.addAttribute("politics",int1);
//		model.addAttribute("ecnomics",int2);
//		model.addAttribute("social",int3);
//		model.addAttribute("culture",int4);
//		model.addAttribute("arts",int5);
//		model.addAttribute("entertainments",int6);
//		model.addAttribute("history",int7);
//		model.addAttribute("sports",int8);
//		model.addAttribute("etc",int9);
//		
//		
//
//		return "signon";
//	}
//	@RequestMapping("/logout")
//	public String logout(HttpServletRequest out, Model model) {
//		String userid=out.getParameter("userid");
//		
//		model.addAttribute("userid",userid);
//		
//		return "logout";
//	}
	
}
