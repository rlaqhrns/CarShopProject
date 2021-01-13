package com.shop.controller.product;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Setter(onMethod_ = @Autowired)
	private CheckOutService checkoutservice;

	@GetMapping("/checkout")
	public String checkout(Model model, User_Tbl user, HttpSession session) {

		try {

			// 나중에 세션으로 아이디 값을 받아오기 전에 유저 정보 가져오기 (재원/20.12.23)
			// 세션 받아와서 id 찾기 가능함 (재원/20.12.31)
			String sessionid = session.getId(); // 세션의 아이디임 (재원/20.12.31)
			String getId = (String)session.getAttribute("id"); // 이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
			// 유저 vo 의 id 를 setter로 getId 설정 (재원/20.12.31)
			System.out.println(getId);
			String userList = "";
			try {
				userList = checkoutservice.isUser(getId).getU_id();	
			}catch(NullPointerException e) {
				userList = null;
			}
				
			System.out.println(userList);
			
			if(userList == null || userList.equals("") || userList.equals(null)) {
				return "carshop/error";
			}
			else { 
			
				
				user.setU_id(getId);
				
				// System.out.println(checkoutservice.userList().get(0).getAddr());
				model.addAttribute("pUser", checkoutservice.userList(user.getU_id()));

				// 세션으로 아이디 값 가져오면 유저 정보 받아쓰기 (재원/20.12.23)
				// System.out.println(checkoutservice.getUser(user.getU_id()));
				// model.addAttribute("pUser", checkoutservice.getUser(user.getU_id()));

				// cart 테이블에서 상품 정보 전부 받아오기 (재원/20.12.23)
				//System.out.println(user.getU_id());
				model.addAttribute("cartList", checkoutservice.cartList(user.getU_id()));

				return "carshop/checkout";
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return "carshop/error";
		}

		
	}


	@PostMapping("/checkout")
	public String checkout(Cart_Tbl cart, User_Tbl user, Order_Histroy_Tbl order, Model model, HttpSession session) {
		
		try {
			// 세션 받아와서 id 찾기 가능함 (재원/20.12.31)
			//String sessionid = session.getId(); // 세션의 아이디임 (재원/20.12.31)
			String getId = (String)session.getAttribute("id"); // 이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
			// 유저 vo 의 id 를 setter로 getId 설정 (재원/20.12.31)
			user.setU_id(getId);
			//System.out.println(order.getAmount());
			checkoutservice.insertBuyList(order, user.getU_id());
			//String u_id = "something";
			//user.setU_id(u_id);
			//System.out.println(user.getU_id());
			checkoutservice.deleteCartList(user.getU_id());	
			
		}catch(Exception e) {
			e.printStackTrace();
			return "carshop/error";
		}
		

		return "redirect:/carshop/confirmation";

	}
	
	
	 
}
