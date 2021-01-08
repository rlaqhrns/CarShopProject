package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shop.service.product.LikeService;
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
		List<Like_Tbl> likeList = likeService.getUserLikedList(getId);
		model.addAttribute("likeList", likeList);
		
		return "carshop/like";
	}

}
