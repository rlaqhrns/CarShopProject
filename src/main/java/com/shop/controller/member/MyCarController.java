package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.MyCarService;
import com.shop.vo.All_User_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@AllArgsConstructor
public class MyCarController {
	
	@Setter(onMethod_ = @Autowired)
	private MyCarService carservice;
	
	@RequestMapping("/mycar")
	public String car(HttpSession session, Model model) {
		String carid = "";
		
		try {
			carid = (String)session.getAttribute("id");
		} catch (Exception e) {
			System.out.println("카포스트 세션아이디 실패");
		}
		
		try {
			model.addAttribute("usercar", carservice.getcarname(carid));  //로그인된 아이디로 등록 된 차 정보 조회 -성연 2021.01.07
		} catch (Exception e) {
			System.out.println("카포스트 차정보겟 실패");
		}
		
		
		
		return"carshop/mycar";
	}
	
	
	 @PostMapping("/updatemycar")
	 public String upcar(String cars, HttpSession session) {
		 String carid = "";
		 try {
			 carid = (String)session.getAttribute("id");
		} catch (Exception e) {
			System.out.println("카포스트 아이디세션 실패");
		}
		 
		 try {
			carservice.updatecar(carid, cars); //새로 받은 차 정보를 해당 아이디에 업데이트 -성연 2021.01.07
		} catch (Exception e) {
			System.out.println("카포스트 업데이트 실패");
			
		}
	 
		 return "redirect:/carshop/mypage"; 
	 }
	 
	

}
