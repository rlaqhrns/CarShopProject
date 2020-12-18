package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.CarShopService;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")

public class HomeController {

	@Setter(onMethod_= @Autowired)
	private CarShopService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());

		return "carshop/index";

	}

	@RequestMapping("/register")
	public String register() {
		return "carshop/register";
	}
	
	@RequestMapping("/seller_register")
	public String seller_register() {
		return "carshop/seller_register";
	}

	@RequestMapping("/product")
	public String product() {
		return "carshop/product";
	}

	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}
	
	@RequestMapping("/like")
	public String like() {
		return"carshop/like";
	}	
	
	@RequestMapping("/cart")
	public String cart() {
		return"carshop/cart";
	}	
	
	@RequestMapping("/home")
	public String a() {
		return "home";
	}

}
