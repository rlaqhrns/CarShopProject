package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.ProductReturnService;
import com.shop.vo.Return_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ProductReturnController {

	@Setter(onMethod_ = @Autowired)
	private ProductReturnService service;

	@RequestMapping("/retrun_end")
	public String return_end(Model model,HttpSession session) {
		String s_id = (String) session.getAttribute("id");
		System.out.println("s_id : " + s_id);
		model.addAttribute("list", service.retrun_(s_id));
		model.addAttribute("count",service.count(s_id));
		model.addAttribute("id",session.getAttribute("id"));		
		return "carshop/return_end";
	}

	@GetMapping("/clickDate")
	@ResponseBody
	public List<Return_Tbl> order_date(@RequestParam("click_date") String click_date , @RequestParam("s_id")String s_id, Model model) {
		String str = click_date.substring(1);
		System.out.println("클릭 날짜 : " +click_date.substring(1));
		
		System.out.println("아이디 : " +s_id) ;
		log.info("  service.order_date = " + service.order_date(str,s_id));
		model.addAttribute("order_date", service.order_date(str,s_id));
		return service.order_date(str,s_id);

	}

}
