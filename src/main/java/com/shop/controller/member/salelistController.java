package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.SalelistService;
import com.shop.vo.All_User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class salelistController { //판매목록 출력

	@Setter(onMethod_=@Autowired)
	private SalelistService service;
	
	//판매자만 판매목록 출력가능
	@RequestMapping("/salelist")
	public String salelist(Model model, HttpSession session) {
		
		try {
			String id = (String)session.getAttribute("id");
			String seller = ((All_User_Tbl)session.getAttribute("user")).getSeller();
			System.out.println("seller? : " + seller);
			if(seller.equals("Y")) {
				model.addAttribute("salelist",service.selectall(id));
				return "carshop/salelist";
			}else {
				System.out.println("판매자가 아님 : " + seller);
				return "redirect:/carshop/error";
			}
			
		}catch(Exception e) {
			System.out.println("salelistController에서의 에러 : " + e.getMessage());
			return "redirect:/carshop/error";
			
		}
		
	}
	
}