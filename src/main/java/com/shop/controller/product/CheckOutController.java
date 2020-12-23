package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.CheckOutService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class CheckOutController {

	@Setter
	private CheckOutService service;

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		
		model.addAttribute("pUser", service.userList());
		
		return "carshop/checkout";
	}
	
}
