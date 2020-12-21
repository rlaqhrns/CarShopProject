package com.shop.controller.member;

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

import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class LoginController {
	
	
	
	//���̴� �α���
	
	@GetMapping("/login")
	public String login() {
		return "carshop/login";
	}
	

	@PostMapping("/login") //��ť��Ƽ�� ���� �ȵȴٸ� �̰ɷ� ����
	public String login_success(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		System.out.println("post2�� ����");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		System.out.println("id : " + id + " pw : " + pw);

		//service.getAllUser();                            //db�����ϸ� ���
		
		if(id.equals("admin") && pw.equals("admin")) {     //db���� test�غ��� ����
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);

			return "/carshop/index";  						 //redirect�� �ȵ�! �ؾ��ϳ�?
			
		} else {
			System.out.println("�α��ν���");
			return "/carshop/loginerror";
		}    
	}
	
	@GetMapping("/all")
	public void all() {
		System.out.println("������ ���ٰ���");
	}
	
	@GetMapping("/member")
	public void member() {
		System.out.println("ȸ���� ���ٰ��� ");
	}
	
	@GetMapping("/admin")
	public void admin() {
		System.out.println("�����ڸ� ���ٰ��� ");
	}
	

}
