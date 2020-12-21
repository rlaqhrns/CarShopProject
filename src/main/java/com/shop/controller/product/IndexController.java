package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.IndexService;
import com.shop.service.product.IndexServiceImple;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
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

	@Setter
	private IndexService service;

	@RequestMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());

		return "carshop/index";

	}

}