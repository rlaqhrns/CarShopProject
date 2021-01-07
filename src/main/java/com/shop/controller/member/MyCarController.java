package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.MyCarService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
@AllArgsConstructor
public class MyCarController {
	
	@Setter(onMethod_ = @Autowired)
	private MyCarService carservice;
	
	@RequestMapping("/mycar")
	public String car(HttpSession session, Model model) {
		String carid = (String)session.getAttribute("id");
		model.addAttribute("usercar", carservice.getcarname(carid));
		
		return"carshop/mycar";
	}
	
	
	 @PostMapping("/updatemycar")
	 public String upcar(String cars, HttpSession session) {
		 String direct = "redirect:/carshop/mypage";
		 String carid = (String)session.getAttribute("id");
		 try {
			carservice.updatecar(carid, cars);
		} catch (Exception e) {
			System.out.println("업데이트 실패");
		}
	 
		 return direct; 
	 }
	 
	

}
