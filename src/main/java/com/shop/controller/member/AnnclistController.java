package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.member.AnnclistService;
import com.shop.vo.Admin_Tbl;
import com.shop.vo.Annc_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class AnnclistController {

	@Setter(onMethod_=@Autowired)
	private AnnclistService service;
	
	@Setter(onMethod_ = @Autowired)
	private AnnclistService anncservice;
	
	
	@RequestMapping("/annclist")
	public String annclist(Model model, HttpSession session) {
		
		//session.setAttribute("id", "asdf");
		//session.setAttribute("id", "admin");
		String admin = (String)session.getAttribute("id");

		
		try {
			Admin_Tbl adminvo = anncservice.adminCheck(admin);
			if (adminvo.getId().equals("admin")) {
				model.addAttribute("annclist",service.selectall());

			}
		} catch (Exception e) {
			System.out.println("관리자권한 없음." + e.getMessage());
			return "redirect:/carshop/error";
		}

		return "carshop/annclist";
	}
	
	@GetMapping("/anncAdd")
	@ResponseBody
	public Annc_Tbl idcheck(@RequestParam("title") String title,@RequestParam("content") String content, Model model) {
		service.anncAdd(title,content);
		return service.selectLast();
	}
	
	@GetMapping("/update_title")
	@ResponseBody
	public void updateTitle(@RequestParam("before_title") String before_title,@RequestParam("after_title") String after_title, Model model) {
		service.updateTitle(before_title, after_title);
	}
	
	@GetMapping("/update_content")
	@ResponseBody
	public void updateContent(@RequestParam("before_content") String before_content,@RequestParam("after_content") String after_content, Model model) {
		service.updateContent(before_content, after_content);
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public void delete(@RequestParam("date") String date, Model model) {
		service.delete(date);
	}
	
	
}
