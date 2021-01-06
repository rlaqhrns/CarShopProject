package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.ConfirmationService;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Return_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ConfirmationController {
	
	@Setter(onMethod_ = @Autowired)
	private ConfirmationService service;
	
	@GetMapping("/confirmation")
	public String getConfirmation(Model model, HttpSession session, Order_Histroy_Tbl order, User_Tbl user) {
		
		//String u_id = "something";
		String getId = (String)session.getAttribute("id"); // 이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
		// 유저 vo 의 id 를 setter로 getId 설정 (재원/20.12.31)
		user.setU_id(getId);
		
		model.addAttribute("buylist", service.orderList(user.getU_id()));
		return "carshop/confirmation";
	}
	
	@PostMapping("/calendar/getAll")
	@ResponseBody
	public List<Order_Histroy_Tbl> getCallenderDB() {
		return null;
		
	}
	
	@PostMapping("/confirmation")
	@ResponseBody
	public List<Order_Histroy_Tbl> getCallenderTitle(Model model, HttpSession session, User_Tbl user, @RequestParam("pname") String title, @RequestParam("order_date") String order_date) {
		
		System.out.println("찍히는지");
		//String u_id = "something";
				String getId = (String)session.getAttribute("id"); // 이미 세션의 set attribute로 id가 설정 되어 있기 때문에 바로 get attribute로 id 가져옴 (재원/20.12.31)
				// 유저 vo 의 id 를 setter로 getId 설정 (재원/20.12.31)
				user.setU_id(getId);
				
				model.addAttribute("buylist", service.orderList(user.getU_id()));
				System.out.println("찍히는지");
		return service.orderList(user.getU_id());
		
	}
	
	
}
