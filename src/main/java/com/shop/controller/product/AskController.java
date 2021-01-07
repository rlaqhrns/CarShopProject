package com.shop.controller.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.AskService;
import com.shop.vo.Ask_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/carshop/*")
public class AskController {
	@Setter(onMethod_ = @Autowired)
	private AskService service;

	@PostMapping("/product/product_ask")
	@ResponseBody
	public List<Ask_Tbl> ask(@RequestParam("p_no")int p_no,Ask_Tbl ask) {
		System.out.println("ask 컨트롤러 들어옴");
		int result = service.askForm(ask);
		if(result ==1) {
			return service.ask(p_no);
		}else {
			return null;
		}
		
		
	}
	
	
	@PostMapping("/product/product_ask_reply")
	@ResponseBody
	public List<Ask_Tbl> ask_reply(Ask_Tbl ask) {
		System.out.println("ask 컨트롤러 들어옴" + ask);

//		int result = serv	ice.ask_reply(ask_no);
//		if(result ==1) {
//			return service.ask(ask.getP_no());
//		}else {
//			System.out.println("else");
//			return null;
//		}
			service.ask_reply(ask);
			return service.ask(ask.getP_no());
		
	}
	
	

}
