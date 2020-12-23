package com.shop.controller.product;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.CartService;
import com.shop.service.product.ProductBuyService;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Prod_Tbl;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@AllArgsConstructor
@Slf4j
public class ProductBuyController {
	@Setter(onMethod_=@Autowired)
	private ProductBuyService productBuyService;
	@Setter(onMethod_=@Autowired)
	private CartService cartService;
	
	
	@GetMapping("/product/details")
	public String detail(Model model,@Param("p_no") int p_no) {
		System.out.println("p_no : " + p_no);
		System.out.println(productBuyService.getProduct(p_no).getP_name());
		
		model.addAttribute("product", productBuyService.getProduct(p_no));
		return "carshop/productdetails";
	}
	@RequestMapping("/product/list")
	public String list(Model model) {
		model.addAttribute("list", productBuyService.getProductAll());
		return "carshop/productList";
	}
	@ResponseBody
	@PostMapping("/product/addcart")
	public boolean pushCart(int p_no, String u_id) {
		//insert문 작성하고 int 리턴받고 398페이지 성공 리턴해보
		System.out.println("p_no : " + p_no);
		System.out.println("u_id : " + u_id);
		Prod_Tbl product = productBuyService.getProduct(p_no);
		Cart_Tbl cart = new Cart_Tbl(); 
		cart.setPno(product.getP_no());
		cart.setU_id(u_id);
		cart.setPname(product.getP_name());
		cart.setAmount(product.getAmount());
		cart.setTotal(0);
		int addCartBoolean = cartService.addCart(cart);
		System.out.println("cart int : "+ addCartBoolean);
		return addCartBoolean == 1;
	}
	
}
