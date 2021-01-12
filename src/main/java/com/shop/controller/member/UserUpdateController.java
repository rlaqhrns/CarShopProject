package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.UserUpdateService;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@RequestMapping("/carshop/*")
@Controller
public class UserUpdateController {

	@Setter(onMethod_ = @Autowired)
	private UserUpdateService uservice;

	@GetMapping("userupdateform")
	public String userupdateForm(Model model, HttpSession session) {

		try {

			// 일반유저인지 판매자유저인지 확인. user에 Y or N 담김.
			String user = ((All_User_Tbl) session.getAttribute("user")).getSeller();
			System.out.println("user_update user : " + user);
			if (user.equals("N")) {
				model.addAttribute("user", uservice.user_select(((All_User_Tbl) session.getAttribute("user")).getId()));
				model.addAttribute("userType", "user");
			} else {
				model.addAttribute("userType", "seller");
				model.addAttribute("user",
						uservice.seller_select(((All_User_Tbl) session.getAttribute("user")).getId()));
			}
			return "carshop/user_update";

		} catch (Exception e) {
			System.out.println("userupdateform 경로에서 에러 발생");
			return "redirect:/carshop/error";
		}
	}

	@RequestMapping("user_updateok")
	public String user_updateok(Model model, HttpSession session, User_Tbl user_tbl) {
		boolean result = uservice.user_update(user_tbl);
		System.out.println("result : " + result);
		return "redirect:/carshop/mypage";
	}

	@RequestMapping("seller_updateok")
	public String seller_updateok(Model model, HttpSession session, Seller_Tbl seller_tbl) {
		boolean result = uservice.seller_update(seller_tbl);
		System.out.println("result : " + result);
		return "redirect:/carshop/mypage";
	}

}
