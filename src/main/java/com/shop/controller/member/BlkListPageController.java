package com.shop.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.AnnclistService;
import com.shop.service.member.BlackListService;
import com.shop.service.member.MyPageService;
import com.shop.vo.Admin_Tbl;
import com.shop.vo.Black_Tbl;
import com.shop.vo.Criteria;
import com.shop.vo.Report_Tbl;
import com.shop.vo.BlkPageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
@AllArgsConstructor
public class BlkListPageController {
	
	@Setter(onMethod_ = @Autowired)
	private BlackListService service;
	
	@Setter(onMethod_ = @Autowired)
	private AnnclistService anncservice;
	
	@GetMapping("/blacklist")
	public String list(Model model, HttpSession session) {
		//session.setAttribute("id", "asdf");
		//session.setAttribute("id", "admin");
		String admin = (String)session.getAttribute("id");  //관리자인지 확인 -성연 20.01.12

		
		try {
			Admin_Tbl adminvo = anncservice.adminCheck(admin);
			if (adminvo.getId().equals("admin")) {
				int[] nums = {0,1,2,3,4,5,6,7,8,9}; //number counts for jtsl foreach grammar -SungYeon 20.12.23
				model.addAttribute("blkcnt", nums);

			}
		} catch (Exception e) {
			System.out.println("관리자권한 없음." + e.getMessage());
			return "redirect:/carshop/error";
		}
		
		return"carshop/blacklist";  //opening black list page -SungYeon 20.12.23
		
	}
	
	@GetMapping(value = "/report")  //신고 페이지 이동 -성연 20.01.12
	public String reportpage(int p_no, HttpSession session, Model model) { //디테일페이지로부터 pno받음, 아이디정보는 세션으로 받음 -성연 20.01.12
		String u_id = (String)session.getAttribute("id");
		model.addAttribute("u_id", u_id);
		
		model.addAttribute("prod", service.getprod(p_no)); //신고하려는 상품의 정보를 출력 -성연 20.01.12
		
		
		return "carshop/report";
	}
	
	@PostMapping(value = "/reportsubmit")  //신고 접수 -성연 20.01.12
	public String reportsubmit(int p_no, String s_id, String u_id, String content) {
		Report_Tbl report = new Report_Tbl();  //새로운 report객체에 담음 -성연 20.01.12
		report.setContent(content);
		report.setP_no(p_no);
		report.setS_id(s_id);
		report.setU_id(u_id);
		
		service.insert_report(report);
		
		
		return "redirect:/carshop/index";  //신고를 하던 상품 디테일 페이지로 다시 이동 -성연 20.01.12
	}
	

}
