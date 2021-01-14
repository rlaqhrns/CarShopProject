package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.CartService;
import com.shop.service.product.LikeService;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Like_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class LikeController {
	@Setter(onMethod_ = @Autowired)
	private LikeService likeService;
	
	
	// like controller 
	@RequestMapping("/like")
	public String cart(Model model, HttpSession session) {
		
		String getId = (String)session.getAttribute("id");
		/* List<Like_Tbl> likeList = likeService.getUserLikedList(getId); */
		List<Like_Tbl> likeList_like = likeService.getCartUpdate(getId);
		/* model.addAttribute("likeList", likeList); */
		model.addAttribute("likeList_like", likeList_like);
		model.addAttribute("u_id", getId);
		
		return "carshop/like";
	}
	

	 	// 찜 개별 삭제 controller 2020.01.08 yun.hj
		@RequestMapping("/like_delete")
		public String delete(@RequestParam int p_no, @RequestParam String u_id) {
			// 문자열을 리턴 
			System.out.println("id는" + u_id + "p_no는" + p_no);
			//찍어보기
			
			likeService.delete(p_no, u_id);
			
			return "redirect:/carshop/like";
		}
		
		// 찜 전체 삭제
		
		  @RequestMapping("/like_deleteAll")
		  public String deleteAll(@RequestParam String u_id) {
		  
		  System.out.println(u_id + "cart_controller 들어 왔습니다."); 
		  System.out.println(
		  "like 출력 "+likeService.deleteAll(u_id)); //cartService.deleteAll(u_id);
		  
		  return "redirect:/carshop/like"; }
	  

		 
		  
}
