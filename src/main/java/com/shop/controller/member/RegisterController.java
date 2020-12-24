package com.shop.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.member.RegisterService;
import com.shop.vo.All_User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterController {

	@Setter(onMethod_=@Autowired)
	private RegisterService service;
	
	
	@RequestMapping("/register")
	public String register() {
		return "carshop/register";

	}
	
	@RequestMapping("/seller_register")
	public String seller_register() {
		return "carshop/seller_register";

	}
	
	@GetMapping("/idcheck")
	@ResponseBody
	public All_User_Tbl idcheck(@RequestParam("id") String id,Model model) {
		System.out.println(id);
		System.out.println(service.idcheck(id));
		return service.idcheck(id);
	}
	
	
	@RequestMapping("/registertest")
	public String registertest() {
		return "carshop/registerTest";
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
