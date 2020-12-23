package com.shop.controller.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.CartService;
import com.shop.service.product.LikeService;
import com.shop.service.product.ProductBuyService;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Like_Tbl;
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
	@Setter(onMethod_=@Autowired)
	private LikeService likeService;
	
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
	@ResponseBody
	@PostMapping("/product/addlike")
	public boolean addLike(int p_no, String u_id) {
		//System.out.println("p_no : " + p_no);
		//System.out.println("u_id : " + u_id);
		Prod_Tbl product = productBuyService.getProduct(p_no);
		Like_Tbl like = new Like_Tbl();
		like.setU_id(u_id);
		like.setP_no(p_no);
		int addLikeBoolean = likeService.addLike(like);
		System.out.println("cart int : "+ addLikeBoolean);
		return addLikeBoolean == 1;
	}
	@ResponseBody
	@PostMapping("/product/checkLiked")
	public boolean checkLiked(int p_no,String u_id) {
		boolean check = false;
		//System.out.println("p_no : " + p_no);
		//System.out.println("u_id : " + u_id);
		List<Like_Tbl> likes = likeService.getUserLikedList(u_id);
		for(Like_Tbl like : likes) {
			if(like.getP_no()==p_no) {
				check = true;
			}
		}
		System.out.println("p_no : "+p_no+", check : " +check);
		return check;
	}
	@ResponseBody
	@PostMapping("/product/deleteLiked")
	public int checkOutLiked(int p_no,String u_id) {
		
		return likeService.deleteLike(p_no, u_id);
	}
	
}
