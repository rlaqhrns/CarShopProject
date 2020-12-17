package com.shop.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping({"/", "index" })
	public String index() {
		return "index";
	}
	
<<<<<<< HEAD
	@RequestMapping("/join")
	public String join() {
		return "join";
=======
	@RequestMapping("/home")
	public String a() {
		return"home";
>>>>>>> branch 'master' of https://github.com/rkqls8522/CarShopProject.git
	}
	
}
