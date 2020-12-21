package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;
import com.shop.service.CarShopService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterProductController {

	//승원님 물품등록
	
	@Setter(onMethod_ = @Autowired)
	private CarShopService service;

	
	@GetMapping("/productForm")
	public String productForm(Model model) {
		System.out.println("productForm 들어옴");
		model.addAttribute("cateParent",service.cateParent());
		model.addAttribute("category", service.category());
		return "carshop/productForm";
	}

	//action 에서 post 방식으로 들어올 시 입력 폼 
	@PostMapping("/productForm")
	public String register(Prod_Tbl product) {
		log.info("컨틀롤러에서 등록 " + product);
		service.productForm(product);
		return "redirect:/carshop/index";
	}

	
}
