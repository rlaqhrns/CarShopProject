package com.shop.controller.product;

import javax.servlet.http.HttpSession;

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
	
	//�¿��� �ε��� ������
	
//	@Setter(onMethod_ = @Autowired)
//	private IndexService indexService;
	
//	@RequestMapping({ "/", "index" })
//	public String index(Model model) {
//		model.addAttribute("list", indexService.index());
//
//		return "carshop/index";
//
//	}

	@Setter(onMethod_ = @Autowired)
	private IndexService service;

	@GetMapping( "index" )
	public String index(Model model,HttpSession session) {
		System.out.println("들어오나 ) 77");
		model.addAttribute("list", service.index());
		model.addAttribute("list2",service.index2());
		model.addAttribute("annc",service.annc());
		model.addAttribute("user",session.getAttribute("user"));
		System.out.println("index들어옴");
		return "carshop/index";

	}

}