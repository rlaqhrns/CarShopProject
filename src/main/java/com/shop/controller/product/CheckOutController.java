package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Setter(onMethod_ =@Autowired)
	private CheckOutService checkoutservice;

	@GetMapping("/checkout")
	public String checkout(Model model) {
		
		System.out.println(checkoutservice.userList().get(0).getAddr());
		model.addAttribute("pUser", checkoutservice.userList());
		
		return "carshop/checkout";
	}
	
}
