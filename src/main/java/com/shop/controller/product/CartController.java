package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.service.product.CartService;
import com.shop.vo.Cart_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j

public class CartController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;

	
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		
		String getId = (String)session.getAttribute("id");
		List<Cart_Tbl> cartList = cartService.getUserCart(getId);
		model.addAttribute("cartList", cartList);
		
		return "carshop/cart";

	}
	
	// 장바구니 개별 삭제 controller 2020.01.08 yun.hj
	@RequestMapping("delete")
	public String delete(@RequestParam String u_id) {
		
		cartService.delete(u_id);
		return "redirect:/carshop/cart";
	}

}
