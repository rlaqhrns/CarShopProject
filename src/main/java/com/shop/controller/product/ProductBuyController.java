package com.shop.controller.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.CartService;
import com.shop.service.product.CategoryService;
import com.shop.service.product.LikeService;
import com.shop.service.product.ProductBuyService;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.ProductCategoryJoin;

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
	@Setter(onMethod_=@Autowired)
	private CategoryService categoryService;
	
	@GetMapping("/product/details")
	public String detail(Model model,@Param("p_no") int p_no) {
		model.addAttribute("product", productBuyService.getProduct(p_no));
		return "carshop/productdetails";
	}
	@GetMapping("/product/list")
	public String list(Model model) {
		model.addAttribute("list", productBuyService.getProductAll());
		model.addAttribute("cateParent", categoryService.cateParent());
		model.addAttribute("category", categoryService.category());
		return "carshop/productList";
	}
	@ResponseBody
	@PostMapping("/product/defaultCategory")
	public List<Prod_Tbl> defaultCategory() {
		return productBuyService.getProductAll();
	}
	@ResponseBody
	@PostMapping("/product/selectCategory")
	public List<ProductCategoryJoin> selcetlist(Integer categoryParents, Integer categoryDetails,String object,String direction) {
		//System.out.println(categoryParents+ ", "+ categoryDetails + object + direction);
		return productBuyService.getProductCategory(categoryParents,categoryDetails,object,direction);
	}
//	@ResponseBody
//	@PostMapping("/product/selectCategoryDetail")
//	public List<ProductCategoryJoin> selcetDetailList(@Param("categoryNum")Integer categoryNum,String object,String direction) {
//		System.out.println("ditails : " + categoryNum + object + direction+"");
//		return productBuyService.getProductCategory(null,categoryNum,object,direction);
//	}
	@ResponseBody
	@PostMapping("/product/addcart")
	public boolean pushCart(int p_no, String u_id) {
	    return productBuyService.pushCart(p_no, u_id);
	}  

	@ResponseBody
	@PostMapping("/product/addlike")
	public boolean addLike(int p_no, String u_id) {
		
		return productBuyService.addLike(p_no, u_id);
	}
	@ResponseBody
	@PostMapping("/product/checkLiked")
	public boolean checkLiked(@Param("p_no")int p_no,@Param("u_id")String u_id) {
		
		return likeService.getUserLikeProduct(p_no, u_id);
	}
	@ResponseBody
	@PostMapping("/product/removeLiked")
	public int checkOutLiked(int p_no,String u_id) {

		return likeService.deleteLike(p_no, u_id);
	}
//	@ResponseBody
//	@PostMapping("/product/sort")
//	public List<Prod_Tbl> sort(String object,String direction) {
//		
//		return productBuyService.getSortProduct(object,direction);
//	}
	
}
