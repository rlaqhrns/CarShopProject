package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.member.SalelistService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class salelistController {

	@Setter(onMethod_=@Autowired)
	private SalelistService service;
	
	@RequestMapping("/salelist")
	public String salelist(Model model, HttpSession session) {
		String s_id = (String)session.getAttribute("id");
		model.addAttribute("salelist",service.selectall(s_id));
		return "carshop/salelist";
	}
	
}
