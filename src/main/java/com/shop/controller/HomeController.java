package com.shop.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.protobuf.Service;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping({"/", "index" })
	public String index() {
		return "carshop/index";

	}
	
	@RequestMapping("/register")
	public String register() {
		return "carshop/register";

	}
	
	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}
	

	@RequestMapping("/home")
	public String a() {
		return"home";
	}
	
	//보미
	@RequestMapping("/login")
	public String login() {
		return "carshop/login";
	}
	
	//보미_로그인성공시 index화면으로 돌아가기(로그인된상태_로그인&회원가입 버튼 안보이게)
	@PostMapping("/login")
	public String login_success(All_User_Tbl all_User_Tbl) {
		//service.idpw_check(all_User_Tbl); //db로부터 id.pw가져오기
		return "redirect:/carshop/index";       //세션객체 생성해서 처리할 것 
	}
	
	

	
}
