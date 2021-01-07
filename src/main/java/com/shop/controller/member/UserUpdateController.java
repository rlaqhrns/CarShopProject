package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.vo.All_User_Tbl;

@RequestMapping("/carshop/*")
@Controller
public class UserUpdateController {

//	@Setter(onMethod_=@Autowired)
//	private UserUpdateService uservice;
//	All_User_Tbl
//	
//	
	@GetMapping("userupdateform")
	public String userupdateForm(Model model, HttpSession session) {
		System.out.println(session.getAttribute("user"));
		All_User_Tbl user = session.getAttribute("user");
//		String user = session.getAttribute("user").getSeller();
		return "carshop/user_update";
	}
	
//	@RequestMapping("updateok")
//	public String updateok(Model model) {
//		
//		User_Tbl user_tbl = new User_Tbl();
//		user_tbl.setname
//		uservice.user_update(user_tbl);
//		return "carshop/mypage";
//	}
	
	
}
