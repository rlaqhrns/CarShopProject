package com.shop.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.AnnclistService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class AnnclistController {

	@Setter(onMethod_=@Autowired)
	private AnnclistService service;
	
	@RequestMapping
	public String annclist(Model model) {
		model.addAttribute("annclist",service.selectall());
		System.out.println(service.selectall());
		
		
		return "carshop/annclist";
	}
	
	
	
	
	
	
	
}
