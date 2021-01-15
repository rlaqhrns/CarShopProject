package com.shop.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.member.RegisterService;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterController { //회원가입

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
	
	//일반유저 - 가입완료버튼 클릭시 실행
	@PostMapping("/onregister")
	public String onregister(Model model, User_Tbl user_tbl) {
		service.adduser(user_tbl);
		return "redirect:login";
	}
	
	//판매자유저 - 가입완료버튼 클릭시 실행
	@PostMapping("/onseller_register")
	public String onseller_register(Model model, Seller_Tbl seller_tbl) {
		service.addseller(seller_tbl);
		return "redirect:login";
	}
	
	//아이디 중복체크
	@GetMapping("/idcheck")
	@ResponseBody
	public All_User_Tbl idcheck(@RequestParam("id") String id, Model model) {
		System.out.println(id);
		System.out.println(service.idcheck(id));
		return service.idcheck(id);
	}
	
	//이메일 중복체크
	@GetMapping("/toemailcheck")
	@ResponseBody
	public All_User_Tbl toemailcheck(@RequestParam("toemail") String toemail, Model model) {
		System.out.println("email : " + toemail);
		System.out.println("service.toemailcheck : " + service.toemailcheck(toemail));
		return service.toemailcheck(toemail);
	}
	
	
}
