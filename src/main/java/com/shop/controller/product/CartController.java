package com.shop.controller.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.member.BlackListController;
import com.shop.service.product.CartService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j

public class CartController {

	@RequestMapping("/cart")
	public String cart() {
		return "carshop/cart";
	}

	// 장바구니로 보내는 컨트롤러
	//	@RequestMapping("insert")
	//		public String insert(@ModelAttribute Cart_Tbl cart, HttpSession session) {

	//	String u_id = (String) session.getAttribute("u_id"); 

	//	if(u_id ==null) {

	// return "carshop/login";;

	// }
	// 로그인 되어 있지 않으면 login 페이지로

	// cart.setU_id(u_id);

	// cart_tbl에 저장

	// 장바구니에 상품이 원래 있는지 없는지 확인
	// int quantity = CartService.quantityCart(vo.getP_no(), u_id);
	// quantity == 0 ? CartService.updateCart(vo) : CartService.insert(vo);

	// if( quantity == 0 ) {
	// 없으면 insert

	// CartService.insert(vo);
	// } else {
	// 있으면 update
	// CartService.updateCart(vo);
	// }

	// return "/carshop/cart";
//	}

	// 담긴 장바구니를 cart_tbl로 맵핑 2020.12.30 hyejeong

	

}
