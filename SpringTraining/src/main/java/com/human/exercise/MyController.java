package com.human.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.apache.ibatis.session.SqlSession;


@Controller
public class MyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/typeadd")
	public String doaddtype() {return "addType";}
	
	@RequestMapping("/addType")
	public String addType(HttpServletRequest hsr) {
		int rtype=Integer.parseInt(hsr.getParameter("typecode"));
		String rname=hsr.getParameter("typename"); // mname 자바의 변수 "menu_name" 폼 태그 안의 input의 변수
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		emp.addType(rtype,rname);
		return "addType";
	}
	
	@RequestMapping("/addRoom")
	public String doaddRoom(Model m) {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Room> alRoom=emp.getRoomList();
		m.addAttribute("alRoom",alRoom);
		
		ArrayList<Roomtype> typeList=emp.getRoomType();
		System.out.println("type size=["+typeList.size()+']');
		m.addAttribute("types",typeList);
		return "addRoom";
		}
	
	@RequestMapping("/addRoom1")
	public String addRoom(HttpServletRequest hsr) {
		String roomcode=hsr.getParameter("roomcode");
		String rname=hsr.getParameter("roomname"); // mname 자바의 변수 "menu_name" 폼 태그 안의 input의 변수
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		
		if(roomcode.equals("")) { //insert
			emp.addRoom(rname,rtype,howmany,howmuch);
		} else { //update
			int code=Integer.parseInt(roomcode);
			emp.updateRoom(code,rname,rtype,howmany,howmuch);
		}
		
		return "redirect:/addRoom";
	}
	
	@RequestMapping("deleteRoom")
	public String doDeleteRoom(HttpServletRequest hsr) {
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		emp.deleteRoom(roomcode);
		System.out.println(roomcode);
		
		return "redirect:/addRoom";
	}
	
	@RequestMapping("/addMenu") // addMenu.jsp를 보여주기 위함
	public String doMenuAdd(Model m) {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Menu> alMenu=emp.getMenuList();
		m.addAttribute("alMenu",alMenu);
		return "addMenu";
	}
	
	@RequestMapping("/addMenu1") // submit 버튼이 눌렸을 때
	public String doAddMenu(HttpServletRequest hsr) {
		String strCode=hsr.getParameter("code"); // 오류나지 않도록 일단 parseInt없이 문자열로 저장
		String mname=hsr.getParameter("menu_name"); // mname 자바의 변수 "menu_name" 폼 태그 안의 input의 변수
		int price=Integer.parseInt(hsr.getParameter("price"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		
		if(strCode.equals("")) { //insert
			emp.addMenu(mname,price);
		} else { //update
			int code=Integer.parseInt(strCode);
			emp.updateMenu(code, mname, price);
		}
		return "redirect:/addMenu";
	}

	@RequestMapping("deleteMenu")
	public String doDeleteMenu(HttpServletRequest hsr) {
		int code=Integer.parseInt(hsr.getParameter("code"));
		
		iEmp emp=sqlSession.getMapper(iEmp.class);
		emp.deleteMenu(code);
		return "redirect:/addMenu";
	}
	
	
	@RequestMapping("/department")
	public String department(Model m) {
		iEmp department=sqlSession.getMapper(iEmp.class);
		ArrayList<Departments> alDep=department.getDepList();
		m.addAttribute("alDep",alDep);
		return "department";
	}
	
	@RequestMapping("/countries")
	public String country(Model m) {
		iEmp country=sqlSession.getMapper(iEmp.class);
		ArrayList<Countries> alCountries=country.getCountryList();
		System.out.println("size ["+alCountries.size()+"]");
		m.addAttribute("alCountries",alCountries);
		return "countries";
	}
	
	
	@RequestMapping("/emp")
	public String doEmpList(Model m) {
		iEmp emp=sqlSession.getMapper(iEmp.class);
		ArrayList<Employee> alEmp=emp.getEmpList();
		System.out.println("size ["+alEmp.size()+"]");
		m.addAttribute("alEmp",alEmp);
		return "emp";
	}
	
	@RequestMapping(value="/look", method=RequestMethod.GET)
	public String look(HttpServletRequest hsr,Model model) {
		model.addAttribute("mobile","010-1234-5678");
		model.addAttribute("address","다가동");
		return "look"; // jsp 파일 이름만 - servlet.context.xml에서 suffix가 알아서 처리해줌.
	}
	
//	@RequestMapping(value="/view",method=RequestMethod.GET)
	@RequestMapping("/view") // 축약형
	public String view(HttpServletRequest hsr) {
		String nick=hsr.getParameter("nickname"); // client에서 보내진 데이터를 수집.
		System.out.println(nick);
		return "redirect:/look"; // redirect를 쓰면 /~ 주소의 메소드를 실행시키면서 호출, 안쓰면 그냥 웹페이지만 띄움.
	}
	
	@RequestMapping("/calc")
	public String calc(HttpServletRequest hsr,Model model) {
		
		try {
			int x1=Integer.parseInt(hsr.getParameter("x1"));
			int x2=Integer.parseInt(hsr.getParameter("x2"));
			String op=hsr.getParameter("op");
			if(op.equals("+")) {
				model.addAttribute("result",x1+x2);
				return "Plus";
			} else if(op.equals("-")) {
				model.addAttribute("result",x1-x2);
				return "Minus";
			} else if(op.equals("*")) {
				model.addAttribute("result",x1*x2);
				return "Multi";
			} else if(op.equals("/")) {
				model.addAttribute("result",x1/x2);
				return "Divide";
			}
				
		}catch(Exception e) {
			model.addAttribute("result","error");
			return "error";
		}
		return "input";
	}
	
	@RequestMapping("/input")
	public String input() {
		
		return "input";
	}
}
		
		

		
		
/*		int x1, x2; //x1 정수변수 이름 "x1" 파라미터 이름
		
		if(hsr.getParameter("x1")=="" || hsr.getParameter("x1")==null ||
				hsr.getParameter("x2")=="" || hsr.getParameter("x2")==null) {
			return "error";
		} else {
			x1=Integer.parseInt(hsr.getParameter("x1")); //parseInt(숫자로만 이루어진 문자열) 아닐 시 바로 오류뜸
			x2=Integer.parseInt(hsr.getParameter("x2"));
		} */
//		model.addAttribute("result",Integer.parseInt(hsr.getParameter("x1"))*Integer.parseInt(hsr.getParameter("x2)));
		 // redirect 를 쓰면 모델값이 사라져버림. (지역변수)
