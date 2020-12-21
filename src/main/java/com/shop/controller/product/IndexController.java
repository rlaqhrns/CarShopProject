package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.IndexService;

import lombok.Setter;

@Controller
@RequestMapping("/carshop/*")
public class IndexController {

	@Setter(onMethod_ = @Autowired)
	private IndexService service;

	@GetMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());
		System.out.println("index들어옴");
		return "carshop/index";

	}

}