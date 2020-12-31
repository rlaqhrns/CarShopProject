package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.CalService;
import com.shop.vo.CalendarVO;

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
	
	@RequestMapping("/mypage")  //마이페이지 접근
	public String mypage(Model model, HttpSession session) { //세션 받을 수 있게 HttpSession -Monica 2020.12.31
		//session.setAttribute("id", "snd12"); 세션 없이 테스트 돌릴때 주석 풀고 사용할 것 -Monica 2020.12.31
		String uid = (String)session.getAttribute("id");
		//System.out.println(uid);
		model.addAttribute("schedules", calservice.getschdList(uid));
		model.addAttribute("idcal", uid);
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

}
