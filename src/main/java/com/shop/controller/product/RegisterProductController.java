package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.CategoryService;
import com.shop.service.product.ProductFormService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterProductController {

	@Setter(onMethod_=@Autowired)
	private CategoryService service;
	private ProductFormService productService;

	@GetMapping("/productForm")
	public String productForm(Model model) {
		System.out.println("productForm �뜝�룞�삕�뜝�룞�삕");
		model.addAttribute("cateParent", service.cateParent());
		model.addAttribute("category", service.category());
		return "carshop/productForm";
	}

	// action 
	@PostMapping("/productForm")
	public String register(Prod_Tbl product) {
		productService.productForm(product);
		return "redirect:/carshop/index";
	}

}