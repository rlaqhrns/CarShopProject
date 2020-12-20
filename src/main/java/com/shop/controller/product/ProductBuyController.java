package com.shop.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.controller.HomeController;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ProductBuyController {
	
	@RequestMapping("/product/details")
	public String detail() {
		return "carshop/productdetails";
	}

}
