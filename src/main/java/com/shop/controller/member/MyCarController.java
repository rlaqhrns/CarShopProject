package com.shop.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class MyCarController {
	
	//������ ����ī������
	
	@RequestMapping("/mycar")
	public String cart() {
		return"carshop/mycar";
	}	
	

}
