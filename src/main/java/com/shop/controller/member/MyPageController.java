package com.shop.controller.member;

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
	private CalService calservice;
	
	@RequestMapping("/mypage")
	public String mypage(Model model) {
		model.addAttribute("schedules", calservice.getschdList("snd12"));
		model.addAttribute("idcal", "snd12");
		return "carshop/mypage";
		
	}
	
	@PostMapping("/insert")
	public String insertSchd(String u_id, String schdtitle, String schdstart, String cal_year, String cal_month, String cal_day) {
		System.out.println("u_id: " + u_id);
		System.out.println("schdtitle" + schdtitle);
		System.out.println("schdstart" + schdstart);
		System.out.println("cal_year" + cal_year);
		System.out.println("cal_month" + cal_month);
		System.out.println("cal_day" + cal_day);
		String endday = cal_year + "-" + cal_month + "-" + cal_day + " " + "23:59:59";
		CalendarVO calVO = new CalendarVO();
		calVO.setSchdtitle(schdtitle);
		calVO.setSchdstart(schdstart);
		calVO.setSchdend(endday);
		calVO.setU_id(u_id);
		
		calservice.recordSchd(calVO);
		
		return "redirect:/calendar/calendar";
	}
	
	@GetMapping("/delschd")
	public String deleteschd(String u_id, String schdtitle) {
		System.out.println("u_id: " + u_id);
		System.out.println("schdtitle" + schdtitle);
		
		int a = calservice.removeSchd(u_id, schdtitle);
		System.out.println(a);
		
		return "redirect:/calendar/calendar";
	}

}
