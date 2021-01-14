package com.shop.controller.product;

import javax.servlet.http.HttpSession;

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

@Controller
@RequestMapping("/carshop/*")
public class CheckOutController {

	@Setter(onMethod_ = @Autowired)
	private CheckOutService checkoutservice;

	@GetMapping("/checkout")
	public String checkout(Model model, User_Tbl user, HttpSession session) {

		try {

			//나중에 세션으로 아이디 값을 받아오기 전에 유저 정보 가져오기 (재원/20.12.23)
			//세션 받아와서 id 찾기 가능함 (재원/20.12.31)
			//String sessionid = session.getId(); 세션의 아이디임 (재원/20.12.31)
			//이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
			String getId = (String)session.getAttribute("id"); 			
			
			//유저 테이블에 id가 없을 경우 NullPointerException이 발생하므로 try catch로 예외처리 (재원/21.0.13)
			//userList는 getId가 db의 유저테이블에 데이터로 있는지 판단하기 위함 (재원/21.01.13)
			String userList = "";
			try {
					userList = checkoutservice.isUser(getId).getU_id();	
				}catch(NullPointerException e) {
					userList = null;
			}

			//일반 유저가 아닌 경우 에러페이지로 이동합니다.(재원/21.0.13)
			if(userList == null || userList.equals("") || userList.equals(null)) {
				return "carshop/errorForbidden";
			}
			else { 
				
				// 세션으로 아이디 값 가져오면 유저 정보 받아쓰기 (재원/20.12.23)
				// model.addAttribute("pUser", checkoutservice.getUser(user.getU_id())); 테스트용
				
				//일반 유저가 맞는 경우 setter로 id 가져옵니다. (재원/21.0.13)
				//유저테이블에 유저의 개인정보를 가져와 model addattribute를 통해 key value로 실어서 jsp에 보냅니다. (재원/21.01.13)
				user.setU_id(getId);
				model.addAttribute("pUser", checkoutservice.userList(user.getU_id()));

				// cart 테이블에서 상품 정보 전부 받아오기 (재원/20.12.23)
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
			// 이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
			String getId = (String)session.getAttribute("id"); 
			user.setU_id(getId);

			//주문이력 테이블에 장바구니 테이블의 데이터를 넘김 (재원/21.01.13)
			checkoutservice.insertBuyList(order, user.getU_id());

			//주문한 장바구니는 삭제합니다. (재원/21.01.13)
			checkoutservice.deleteCartList(user.getU_id());	
			
		}catch(Exception e) {
			e.printStackTrace();
			return "carshop/error";
		}
		

		return "redirect:/carshop/confirmation";

	}
	
	
	 
}
