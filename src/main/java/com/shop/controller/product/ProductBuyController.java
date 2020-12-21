package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ProductBuyController {
	
	//보군님 물품구매 페이지
	
	@RequestMapping("/product/details")
	public String detail() {
		return "carshop/productdetails";
	}

}
