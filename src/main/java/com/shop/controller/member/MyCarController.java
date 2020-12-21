package com.shop.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class MyCarController {
	
	//성연님 마이카페이지
	
	@RequestMapping("/cart")
	public String cart() {
		return"carshop/cart";
	}	
	

}
