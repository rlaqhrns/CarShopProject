package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.ConfirmationService;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ConfirmationController {
	
	@Setter(onMethod_ = @Autowired)
	private ConfirmationService service;
	
	@GetMapping("/confirmation")
	public String getConfirmation(Model model, Order_Histroy_Tbl order, User_Tbl user) {
		
		String u_id = "something";
		
		user.setU_id(u_id);
		
		//model.addAttribute("buylist", service.orderList(user.getU_id()));
		return "carshop/confirmation";
	}
	
	
}
