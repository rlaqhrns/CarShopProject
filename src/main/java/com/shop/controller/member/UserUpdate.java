package com.shop.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/carshop/*")
@Controller
public class UserUpdate {

	@GetMapping("userupdateform")
	public String userupdateForm() {
		System.out.println("userudateform 들어옴");
		return "carshop/user_update";
	}

}
