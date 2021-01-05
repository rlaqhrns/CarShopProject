package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.CalService;
import com.shop.service.member.MyPageService;
import com.shop.vo.CalendarVO;
import com.shop.vo.Criteria;
import com.shop.vo.MyAskPageDTO;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
@AllArgsConstructor
public class MyPageController {
	
	@Setter(onMethod_ = @Autowired)
	private CalService calservice;  //달력 스케줄 추가삭제 서비스 -Monica 2020.12.31
	
	@Setter(onMethod_ = @Autowired)
	private MyPageService pageservice;
	
	@RequestMapping("/mypage")  //마이페이지 접근
	public String mypage(Model model, HttpSession session) { //세션 받을 수 있게 HttpSession -Monica 2020.12.31
		//session.setAttribute("id", "snd12"); 세션 없이 테스트 돌릴때 주석 풀고 사용할 것 -Monica 2020.12.31
		session.setAttribute("id", "asdf");  //셀러
		String uid = (String)session.getAttribute("id");
		//System.out.println(uid);
		model.addAttribute("schedules", calservice.getschdList(uid));
		System.out.println(calservice.getschdList(uid));
		model.addAttribute("idcal", uid);
		model.addAttribute("bestpord", pageservice.bestprods());
		
		Seller_Tbl sellerVO;
		User_Tbl userVO;
		
		if(pageservice.checkid(uid).equals("Y")) {
			sellerVO = pageservice.getseller(uid);
			model.addAttribute("user", sellerVO);
			model.addAttribute("status", "seller");
		} else if(pageservice.checkid(uid).equals("N")) {
			userVO = pageservice.getuser(uid);
			model.addAttribute("user", userVO);
			model.addAttribute("status", "user");
		}
		
		
		return "carshop/mypage";
		
	}
	
	@PostMapping("/insert")  //달력 스케쥴 db에 저장 -Monica 2020.12.31
	public String insertSchd(String u_id, String schdtitle, String schdstart, String cal_year, String cal_month, String cal_day) {
//		System.out.println("u_id: " + u_id);
//		System.out.println("schdtitle" + schdtitle);
//		System.out.println("schdstart" + schdstart);
//		System.out.println("cal_year" + cal_year);
//		System.out.println("cal_month" + cal_month);
//		System.out.println("cal_day" + cal_day);
		String endday = cal_year + "-" + cal_month + "-" + cal_day + " " + "23:59:59";  //나중에 사용하기 편한 형태로 db에 저장 -Monica 2020.12.31
		CalendarVO calVO = new CalendarVO(); //달력vo생성 -Monica 2020.12.31
		calVO.setSchdtitle(schdtitle);
		calVO.setSchdstart(schdstart);
		calVO.setSchdend(endday);
		calVO.setU_id(u_id);
		
		calservice.recordSchd(calVO); //서비스 호출 -Monica 2020.12.31
		
		return "redirect:/carshop/mypage";  //마이페이지로 리다이렉트 -Monica 2020.12.31
	}
	
	@GetMapping("/delschd") //달력 스케쥴 삭제 -Monica 2020.12.31
	public String deleteschd(String u_id, String schdtitle) {
//		System.out.println("u_id: " + u_id);
//		System.out.println("schdtitle" + schdtitle);
		
		int a = calservice.removeSchd(u_id, schdtitle);  //서비스 호출 -Monica 2020.12.31
		//System.out.println(a);
		
		return "redirect:/carshop/mypage"; //마이페이지로 리다이렉트 -Monica 2020.12.31
	}
	
	@GetMapping(value = "/asklistget", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MyAskPageDTO> myasklist(int pageNum, HttpSession session){
		Criteria crit = new Criteria();
		crit.setPageNum(pageNum);
		crit.setAmount(4);
		crit.setStartNum((crit.getPageNum()-1)*crit.getAmount());
		System.out.println("ask crit: " + crit);
		
		String s_id = null;
		String u_id = null;
		
		//session.setAttribute("id", "asdf");  셀러
		//session.setAttribute("id", "awn4#4");  일반유저
		
		String user = (String)session.getAttribute("id");
		System.out.println("user id = " + user);
		System.out.println(pageservice.checkid(user));
		
		if(pageservice.checkid(user).equals("Y")) {
			s_id = user;
		} else if(pageservice.checkid(user).equals("N")) {
			u_id = user;
		}
		System.out.println("sid: " + s_id + " uid: " + u_id);
		
		return new ResponseEntity<>(pageservice.getAskList(crit, s_id, u_id), HttpStatus.OK);
	}
}
