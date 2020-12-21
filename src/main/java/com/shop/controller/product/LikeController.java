package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class LikeController {
	
	//������ �� ������
	
	@RequestMapping("/like")
	public String like() {
		return"carshop/like";
	}	
	

}
