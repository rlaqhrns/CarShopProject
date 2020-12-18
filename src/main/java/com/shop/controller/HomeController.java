package com.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.CarShopService;

import lombok.Setter;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")

public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private CarShopService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());

		return "carshop/index";

	}

	@RequestMapping("/register")
	public String register() {
		return "carshop/register";

	}

	@RequestMapping("/product")
	public String product() {
		return "carshop/product";
	}

	@RequestMapping("/checkout")
	public String checkout() {
		return "carshop/checkout";
	}

	@RequestMapping("/home")
	public String a() {
		return "home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "carshop/login";
	}
	
	//보미_로그인성공시 index화면으로 돌아가기(로그인된상태_로그인&회원가입 버튼 안보이게)
	@PostMapping("/login")
	@ResponseBody
	public String login_success(HttpServletRequest request, HttpServletResponse response ) throws IOException {
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		System.out.println("id : " + id + " pw : " + pw);

		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		//service.getAllUser();                            //db연결하면 사용
		
		if(id.equals("admin") && pw.equals("admin")) {     //db없이 test해보기 위함
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);
			return "carshop/index";  						 //redirect가 안됨! 해야하나?
			
		} else {
			out.println("hi!");
			return null;
		}    
		
	
	}
	

}
