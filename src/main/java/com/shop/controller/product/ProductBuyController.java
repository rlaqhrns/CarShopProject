package com.shop.controller.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.AskService;
import com.shop.service.product.CartService;
import com.shop.service.product.CategoryService;
import com.shop.service.product.LikeService;
import com.shop.service.product.ProductBuyService;
import com.shop.service.product.ReplyService;
import com.shop.vo.ProductCategoryJoin;
import com.shop.vo.Reply_Tbl;

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
	@Setter(onMethod_ = @Autowired)
	private AskService askService;
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	@GetMapping("/product/details")
	public String detail(Model model,@Param("p_no") int p_no, HttpSession session) {
		model.addAttribute("product", productBuyService.getProductDetails(p_no));
		// session 에 담겨있는 id 를 가져와서 model 에 담음
		model.addAttribute("askList",askService.ask(p_no));
		model.addAttribute("user",session.getAttribute("user"));
		model.addAttribute("replyList",replyService.replyList(p_no));
		System.out.println("유저는 : " +session.getAttribute("user"));
		
		List<Reply_Tbl> list = replyService.replyList(p_no);
		List<String[]> array = new ArrayList<String[]>();
//		for(Reply_Tbl reply : list) {
//			System.out.println(Arrays.toString(reply.getR_img().split(",")));
//			array.add((reply.getR_img().split(",")));
//		}
////		for(int i =0; i<list.size(); i++) {
////			array.add(list.get(i).getR_img().split(","));
////			System.out.println(list.get(i).getR_img().split(","));
////
////		}

		
		model.addAttribute("imgArray",array );

		
		return "carshop/productdetails";
	}
	@GetMapping("/product/list")
	public String list(Model model, HttpSession session) {
		//model.addAttribute("list", productBuyService.getProductAll());
		model.addAttribute("cateParent", categoryService.cateParent());
		model.addAttribute("category", categoryService.category());
		String getId = (String)session.getAttribute("id");
		try {
			model.addAttribute("UserID", getId );
			model.addAttribute("UserCar", productBuyService.getUser(getId).getCars());
			
		}catch(Exception e) {
			System.out.println("ProductBuyController : 세션정보 없거나, 차량정보없음");
		}
		
		return "carshop/productList";
	}

	@ResponseBody
	@PostMapping("/product/selectCategory")
	public List<ProductCategoryJoin> selcetlist(Integer categoryParents, Integer categoryDetails,String sorting) {
		//System.out.println(categoryParents+ ", "+ categoryDetails + object + direction);
		return productBuyService.getProductCategory(categoryParents,categoryDetails,sorting);
	}
//	@ResponseBody
//	@PostMapping("/product/selectCategoryDetail")
//	public List<ProductCategoryJoin> selcetDetailList(@Param("categoryNum")Integer categoryNum,String object,String direction) {
//		System.out.println("ditails : " + categoryNum + object + direction+"");
//		return productBuyService.getProductCategory(null,categoryNum,object,direction);
//	}
	@ResponseBody
	@PostMapping("/product/addcart")
	public boolean pushCart(int p_no, String u_id,int quantity) {
	    return productBuyService.pushCart(p_no, u_id, quantity);
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
