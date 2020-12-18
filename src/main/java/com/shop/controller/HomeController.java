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

	@Setter(onMethod_ = @Autowired)
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

	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}

	@RequestMapping("/home")
	public String a() {
		return "home";
	}
	
	@GetMapping("/productForm")
	public String productForm(Model model) {
		System.out.println("productForm 들어옴");
		
		return "carshop/productForm";
	}
	
	// action 에서 post 방식으로 들어올 시 입력 폼
	@PostMapping("/productForm")
	public String register(Prod_Tbl product) {
		log.info("컨틀롤러에서 등록 " +  product);
		service.productForm(product);
		return "redirect:/carshop/index";
	}

}
