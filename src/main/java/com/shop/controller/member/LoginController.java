package com.shop.controller.member;

import javax.servlet.http.HttpServletRequest;
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
	
	@GetMapping("/headerAjax")
	@ResponseBody
	public boolean receive(HttpServletRequest request, HttpSession session) {

		boolean result = false;
		HttpSession session1 = request.getSession(false);		//세션이 있다면 저장, 없다면 null반환 
		String sessId = (String)session.getAttribute("id"); 	//세션에 저장된 아이디가 있는지를 확인하고자함
		System.out.println("sessId 세션에 저장된 아이디  = " + sessId);

		if(sessId != null) result = true;    					//로그인된상태 = "로그아웃버튼보이게"
		else result = false;
		return result;
	}
	
	@GetMapping("/login")
	public String login() {
		return "carshop/login";
	}
	
	@PostMapping("/onlyId")
	@ResponseBody
	public String getAjaxId(@RequestBody Login logvo) {
		String back = "";
		String result = loginservice.getId(logvo.getId());     //딱 id만 가져와서 박힘
		if(result == null) back="-1";
		else back="2";
		return back;
	}
	
	@PostMapping("/onlyPw")
	@ResponseBody
	public String getAjaxPw(@RequestBody Login logvo) {
		String back = "";
		String result = loginservice.getPw(logvo.getId(), logvo.getPw());     //딱 id만 가져와서 박힘
		
		if(result == null) back="-1";
		else back="2";       //로그인정보 일치
		return back;
	}
	
	@PostMapping("/login") 
	@ResponseBody
	public String login_success( HttpSession session,@RequestBody Login logvo) {
		String back = "";
		String result = loginservice.login(logvo.getId(), logvo.getPw(), session);
		
		if(result == "1") back = "1";			//관리자로 로그인
		else if(result == "2") back = "2";		//회원으로 로그인
		else back = "-1";						//로그인정보가 틀릴경우
		System.out.println("back ==  7) " + back);
		return back;
	}
	  
	@GetMapping("/logout")
	public String login2(HttpServletRequest request, HttpSession session) {
		session.invalidate();
		HttpSession session1 = request.getSession(false);
		return "carshop/index";
	}
	
	
	@GetMapping("/indexlogin")
	public String indexlogin(HttpSession session) {
		String sessionid = session.getId();
		String memberId = (String)session.getAttribute("id");
		return "carshop/indexlogin";
	}
	
	@PostMapping("/indexlogin")
	public String indexlogin2() {
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
		
		aut.setPw(login.getPw1());
		//hidden으로 email정보를 가져온다.
		loginservice.pwsave(aut);

		return "/carshop/login";
	}

	
}


