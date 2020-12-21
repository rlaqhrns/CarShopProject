package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.ProductReturnServiceImple;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ProductReturnController {

	@Setter(onMethod_ = @Autowired)
	private ProductReturnServiceImple service;

	@RequestMapping("/retrun_end")
	public String return_end(Model model) {
		model.addAttribute("list", service.retrun_());
		System.out.println("교환반품페이지 들어옴 ");
		log.info("리스트" + service.retrun_());
		return "carshop/return_end";
	}

}
