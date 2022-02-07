package com.human.exam;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.ArrayList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "home";
	}
	
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(Model model) {
		iExam exam=sqlSession.getMapper(iExam.class);
		
	   return "login";
	}
	

	@RequestMapping("/doLogin")
	public String doLogin(HttpServletRequest hsr, Model model) { 
		String userid=hsr.getParameter("userid");
		iExam exam=sqlSession.getMapper(iExam.class); 
		exam.update(userid);
		model.addAttribute("id",userid);
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkid", method= RequestMethod.POST)
	public String CheckId(HttpServletRequest hsr) {
		String id=hsr.getParameter("userid");
		iExam exam=sqlSession.getMapper(iExam.class);
		ArrayList<Member> check=exam.Signon_check();
		System.out.println("size["+check.size()+"]");
		if(id.equals(check)) {
				return "signon";
				}else {
				return"login";
				}
	}
	@RequestMapping("/signon")
	public String signon() {
		return "signon";
	}
	
	@RequestMapping(value="/DoSignon", method = RequestMethod.POST)
	public String DoSignon(HttpServletRequest hsr, Model model){
		 String name =hsr.getParameter("name");
		 String gender=hsr.getParameter("gender");
		 String userid =hsr.getParameter("userid");
		 String passcode =hsr.getParameter("passcode");
		 String[] interest=hsr.getParameterValues("Interests");
		 String inter="";
		 for(int i=0; i<interest.length; i++) {
			 if (inter!="")inter+=",";
			 inter+=interest[i];
		 }
		 iExam exam=sqlSession.getMapper(iExam.class); //iExam=인터페이스명 exam=변수명 sqlSession.getMapper(인터페이스명.class)
		 exam.DoSignon(name,gender, userid,passcode, inter);
		 
		return "login";
		
	}
	
	@RequestMapping("/Signon_check")
	public String signon_check(HttpServletRequest hsr, Model model) {
		String name=hsr.getParameter("name");
		if(name.equals("")) {
			return "signon";
		} else {
			return "login";
		}
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr) { //id값 안넣어준채로 가니까 <c:if test="${id==null}">검사해서 빈칸이니까 home으로 돌아감
		System.out.println(hsr.getParameter("userid"));
		String userid=hsr.getParameter("userid");
		iExam exam=sqlSession.getMapper(iExam.class); 
		exam.update1(userid);
		return "home";
	}

	
}
