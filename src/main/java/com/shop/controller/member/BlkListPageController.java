package com.shop.controller.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.BlackListService;
import com.shop.service.member.MyPageService;
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
	
	@GetMapping("/blacklist")
	public String list(Model model) {

		int[] nums = {0,1,2,3,4,5,6,7,8,9}; //number counts for jtsl foreach grammar -SungYeon 20.12.23
		model.addAttribute("blkcnt", nums);
		
		return"carshop/blacklist";  //opening black list page -SungYeon 20.12.23
	}
	
	@GetMapping(value = "/report")
	public String reportpage(int p_no, HttpSession session, Model model) {
		String u_id = (String)session.getAttribute("id");
		model.addAttribute("u_id", u_id);
		
		model.addAttribute("prod", service.getprod(p_no));
		
		
		return "carshop/report";
	}
	
	@PostMapping(value = "/reportsubmit")
	public String reportsubmit(int p_no, String s_id, String u_id, String content) {
		Report_Tbl report = new Report_Tbl();
		report.setContent(content);
		report.setP_no(p_no);
		report.setS_id(s_id);
		report.setU_id(u_id);
		
		service.insert_report(report);
		
		
		return "redirect:/carshop/product/details?p_no=" + p_no;
	}
	

}
