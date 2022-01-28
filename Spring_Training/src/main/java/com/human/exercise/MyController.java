package com.human.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/menuadd") //addMenu.jsp 보여주기 위한 애
	public String doMenuAdd() {
		return "addMenu";
	}
	
	@RequestMapping("/addMenu") //submit 버튼이 눌렸을때 실행되는 애
	public String doAddMenu(HttpServletRequest hsr) {
		String mname=hsr.getParameter("menu_name");
		int price=Integer.parseInt(hsr.getParameter("price"));
		System.out.println("메뉴 :"+mname+"가격 :"+price);
		iEmp emp=sqlSession.getMapper(iEmp.class); //DB정보 쭉 추출
		emp.addMenu(mname,price); //인터페이스와 리턴값 타입만 맞으면됨 서로 변수명 다르게 설정해도됨 ->호출
		return "addMenu";
	}
	
	@RequestMapping("/department")
	public String doDepartments(Model m) {
		iDepartment Depart=sqlSession.getMapper(iDepartment.class);
		ArrayList<dep> dep=Depart.getDepartList();
		System.out.println("size["+dep+"]");
		m.addAttribute("aldep",dep);
		return "department";
		
	}
	@RequestMapping("/countries")
	public String docountries(Model m) {
		iCountries Countries=sqlSession.getMapper(iCountries.class); //인터페이스명 변수=sql.get(인터페이스명.class)
		ArrayList<ctry> alctry=Countries.getCountriesList(); //ArrayList<게터세터한 자바> 변수명 = 인터페이스변수.get~()
		System.out.println("size["+alctry.size()+"]");
		m.addAttribute("alctry",alctry);//어트리뷰트이름, 위에쓴 변수명(Dto의 ArrayList)
		return"Countries";
	}
	@RequestMapping("/emp")
	public String doEmpList(Model m) {
		iEmp emp= sqlSession.getMapper(iEmp.class);//(interface 이름.class)
		ArrayList<Employee> alEmp= emp.getEmpList();
		System.out.println("size["+alEmp.size()+"]");
		m.addAttribute("alEmp",alEmp);
//		int n =multiply(3,5);
		return"emp";
	}
	@RequestMapping(value="/look",method=RequestMethod.GET)
	public String look(HttpServletRequest hsr,Model model) { //HSR은 받아오는거 MDL은 내려보내는거
		model.addAttribute("mobile","010-3333-4444");
		model.addAttribute("address","어딘가");
		return "look";
	}
	@RequestMapping("/view")
	public String view(HttpServletRequest hsr) {
		String nick=hsr.getParameter("nickname"); // hsr로 받아서 String nick에 넣.// client에서 보내진 데이터를 수집 
		System.out.println("nick ["+nick+"]");
		return "look"; //return "redirect:/look";
	}
	
	@RequestMapping("/input")
	public String input() {
		return "input";
	}
	@RequestMapping("/calc")
	public String calc(HttpServletRequest hsr, Model model) {//읽어들이는 hsr
//		try {
//			int x1=Integer.parseInt(hsr.getParameter("x1")); //name=x1으로 지정해놨으니까 x1으로 받.
//			int x2=Integer.parseInt(hsr.getParameter("x2")); // 앞의 x1은 int, 뒤는 attribute
//			int result=x1*x2;
//			model.addAttribute("result",result);
//			if(result>=20) return "calc";
//			else if(result<20) return "input";
//		} catch (Exception e) {
//			model.addAttribute("result","error");
//			return "input";
//		}
//		return null; <!-- 여기까지 내코드-->
//		String jspName="input";
//		try {
//			String x1=hsr.getParameter("x1");
//			String x2=hsr.getParameter("x2");
//			if(x1==null || x2==null || x1.equals("") || x2.equals("")) {
//				model.addAttribute("result","error");
//			} else {
//				model.addAttribute("result",Integer.parseInt(x1)*Integer.parseInt(x2));
//				if(Integer.parseInt(x1)*Integer.parseInt(x2)>20) jspName="input";
//				else jspName="error";
//			}
//		} catch(Exception e) {
//			model.addAttribute("result","error");
//			jspName="error";
//		}
//		return jspName; <!--여기까지 선생님 코드-->
		String x1=hsr.getParameter("x1");
		String x2=hsr.getParameter("x2");
		String op=hsr.getParameter("op");
		String result=hsr.getParameter("result");
		try {
		if(op.equals("+")) {
			model.addAttribute("result",Integer.parseInt(x1)+Integer.parseInt(x2));
			return "plus";
			}else if(op.equals("-")) {
				model.addAttribute("result",Integer.parseInt(x1)-Integer.parseInt(x2));
				return "minus";
			}else if(op.equals("*")) {
				model.addAttribute("result",Integer.parseInt(x1)*Integer.parseInt(x2));
				return "multi";
			}else if(op.equals("/")) {
				model.addAttribute("result",Integer.parseInt(x1)/Integer.parseInt(x2));
				return "divide";
			}else {return "error";}
		
		} catch(Exception e) {
		model.addAttribute("result","연산자불명");
		return "error";
		}

	}
}
