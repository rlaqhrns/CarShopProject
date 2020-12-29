package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.CheckOutService;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class CheckOutController {

	@Setter(onMethod_ =@Autowired)
	private CheckOutService checkoutservice;

	@GetMapping("/checkout")
	public String checkout(Model model, User_Tbl user) {
		
		//나중에 세션으로 아이디 값을 받아오기 전에 유저 정보 가져오기 (재원/20.12.23)
		//System.out.println(checkoutservice.userList().get(0).getAddr());
		model.addAttribute("pUser", checkoutservice.userList());
		
		//세션으로 아이디 값 가져오면 유저 정보 받아쓰기 (재원/20.12.23)
		//System.out.println(checkoutservice.getUser(user.getU_id()));
		//model.addAttribute("pUser", checkoutservice.getUser(user.getU_id()));
		
		//cart 테이블에서 상품 정보 전부 받아오기 (재원/20.12.23)
		
		String u_id = "something";
		user.setU_id(u_id);
		System.out.println(user.getU_id());
		model.addAttribute("cartList", checkoutservice.cartList(user.getU_id()));
		
		return "carshop/checkout";
	}
	
	@PostMapping("/checkout")
	public String checkout(Cart_Tbl cart, User_Tbl user, Order_Histroy_Tbl order, Model model) {
		
		System.out.println(order.getAmount());
		checkoutservice.insertBuyList(order);
		checkoutservice.deleteCartList(cart.getU_id());
		
		return "redirect:confirmation";
		
	}
	
}
