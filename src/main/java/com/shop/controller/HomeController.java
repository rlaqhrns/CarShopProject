package com.shop.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/carshop/product")
	public String product() {
		return "/carshop/product";
	}
	
	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}
	

	@RequestMapping("/home")
	public String a() {
		return"home";
	}

	
}
