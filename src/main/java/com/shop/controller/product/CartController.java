package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.member.BlackListController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j

public class CartController {

	@RequestMapping("/cart")
	public String cart() {
		return"carshop/cart";
	}	
	
}
