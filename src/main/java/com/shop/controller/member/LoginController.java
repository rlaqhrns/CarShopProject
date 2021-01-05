package com.shop.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.mapper.member.LoginMapper;
import com.shop.service.member.LoginServiceImple;
import com.shop.service.member.MailServiceImpl;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Login;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class LoginController {
	

	@Setter(onMethod_=@Autowired)
	MailServiceImpl mailservice;
	
	@Setter(onMethod_=@Autowired)
	LoginServiceImple loginservice;
	
	@Setter(onMethod_=@Autowired)
	LoginMapper logmapper; //컨트롤러에서 바로 mapper를 가져오는것이 아닙니다.
	
	@Setter(onMethod_=@Autowired)
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
	public String login_success( HttpSession session, Login logvo) {
		
		//입력받은 id,pw확인
		System.out.println("id = " + logvo.getId() + " pw = " + logvo.getPw());
		
		boolean result = loginservice.login(logvo.getId(), logvo.getPw(), session);
		
		if(result == true) {
//			if(logvo.getId() == "admin"){
//			return "carshop/adminpage";                  -- 관리자페이지로 랜딩할경우
//			}
			return "carshop/indexlogin";
		}
		else return "/carshop/loginerror";
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
//		if() {    	
//			return "/carshop/indexlogin";  						 
//		} else {	
//			return "/carshop/loginerror";
//		}    
//	}
	
	@GetMapping("/indexlogin")
	public String indexlogin(HttpSession session) {
		String sessionid = session.getId();
		System.out.println("세션아이디는222  : " + sessionid);
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
	@ResponseBody
	public boolean pwsearch2 (@RequestBody All_User_Tbl aut, Model model) {

		boolean result =false;
		String email = aut.getEmail();
		All_User_Tbl db_id = loginservice.getid(email);
			//db에 id가 없을경우
			if(db_id == null) {
				return result;
			}
		String id = db_id.getId();

		try {
			//db에 
			String emailcheck = loginservice.getemail(aut);
			
			if(emailcheck == "1") {   //이메일이 db와 일치하는경우
				mailservice.sendMail(email, id);
				result = true;
			} else {
				result= false;        //이메일이  일치하지않거나, 저장된 이메일이 없을때
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	@GetMapping("/pwsetting")
	public String pwsetting() {

		return "/carshop/pwsetting";
	}
	
	@PostMapping("/pwsetting")
	public String pwsetting1(Model model, String email) {
		//이메일 정보를 가지고 pwsetting.jsp로 이동
		model.addAttribute("email", loginservice.emailcheck(email).getEmail());
		return "/carshop/pwsetting";
	}
	
	@PostMapping("/pwsetting2")
	public String pwsetting2(Login login, All_User_Tbl aut) {
		String result = "";
		String email = login.getEmail();
		String pw1 = login.getPw1();
		String pw2 = login.getPw2();
		System.out.println("pw1  " + pw1 + "pw2  " +  pw2 + " email : " + email);
		
		aut.setPw(login.getPw1());
		System.out.println("aut = " + aut);
		//hidden으로 email정보를 가져온다.
		loginservice.pwsave(aut);
		System.out.println("=======저장완료========");
			return "/carshop/login";

	}

	
}
