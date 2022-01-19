package com.human.ncs7;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BBS {
	@Autowired
	private SqlSession sqlSession;
	
   @RequestMapping("/list")
   public String list(Model model) {
	   Ibbs bbs=sqlSession.getMapper(Ibbs.class);
	   ArrayList<Post> alPost=bbs.getList();
	   System.out.println("record count: "+alPost.size());
	   model.addAttribute("alPost", alPost);
      return "list";
   }
   @RequestMapping("/view")
   public String view(HttpServletRequest hsr, Model model) {
	   int id=Integer.parseInt(hsr.getParameter("id"));
	   
	   Ibbs bbs=sqlSession.getMapper(Ibbs.class);
	   Post post=bbs.getView(id); //호출하는 메소드안에 아이디 값을 넣어주면
	   model.addAttribute("post",post);
	   return "view";
   }
   @RequestMapping("/compose")
   public String compose() {
	   return "write";
   }
   
   @RequestMapping(value="/write", method=RequestMethod.POST)
   public String write(HttpServletRequest hsr) {
	   String title=hsr.getParameter("title");
	   String name=hsr.getParameter("name");
	   String content=hsr.getParameter("content");
	   System.out.println("title["+title+"]");
	   System.out.println("title["+name+"]");
	   System.out.println("title["+content+"]");
	   Ibbs bbs=sqlSession.getMapper(Ibbs.class);
	   bbs.writePost(title,name,content);
	   return "redirect:/list";
	   }
}