package com.shop.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
import com.shop.service.member.LoginServiceImple;
import com.shop.service.member.MailService;
import com.shop.service.member.MailServiceImpl;
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
	

	@Autowired
	MailServiceImpl mailservice = new MailServiceImpl();
	LoginServiceImple loginservice = new LoginServiceImple();
	
	@Autowired
	private MailService mailService;
	private JavaMailSenderImpl mailSender;
	
//	@GetMapping("/index") 
//	public String index() {
//		return "carshop/index";
//	}

	@GetMapping("/login")
	public String login() {
		return "carshop/login";
	}
	


	@PostMapping("/login") 
	public void login_success(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		loginservice.login(request, response, session);

	}
	  
	@GetMapping("/logout")
	public String login2() {
		System.out.println("logout들어옴");
		
		return "carshop/login";
	}
	

//	@PostMapping("/logout") 
//	public String login_success3(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
//		
//		System.out.println("logout들어옴");
//		
//		if() {    
//			
//
//			return "/carshop/indexlogin";  						 
//			
//		} else {
//			
//			return "/carshop/loginerror";
//		}    
//	}
	

	@GetMapping("/indexlogin")
	public String indexlogin() {
		return "carshop/indexlogin";
	}
	
	@PostMapping("/indexlogin")
	public String indexlogin2() {
		return "carshop/indexlogin";
	}
	@GetMapping("/loginerror")
	public String loginerror() {
		return "carshop/loginerror";
	}
	
	@PostMapping("/loginerror")
	public String loginerror2() {
		return "carshop/indexlogin";
	}
	
	@GetMapping("/pwsearch")
	public String pwsearch() {
		return "/carshop/pwsearch";
	}
	
	@PostMapping("/pwsearch")
	public String pwsearch2() {
		return "/carshop/index";
	}
	
	@GetMapping("/sendmail")
	public String sendMail1() {
		return "carshop/pwsearch";
	}
	
	@PostMapping("/sendmail")
	public String sendMail(HttpServletRequest request, HttpServletResponse response) throws MessagingException{
		String email = request.getParameter("email");
		mailservice.sendMail();						        //MailServiceImpl
		return "carshop/pwsearch";
	}
	
	@GetMapping("/pwsetting")
	public String pwsetting() {
		return "/carshop/pwsetting";
	}
	
	@PostMapping("/pwsetting")
	public String pwsetting2() {
		return "/carshop/login";
	}

	
}
