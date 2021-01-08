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

	@GetMapping("/thankyou")
	public String thankyou(HttpServletRequest request, HttpSession session) {
		request.getSession().invalidate();
		System.out.println("여기 세션값은1)  "+ request.getSession(false));
		System.out.println("여기 세션값은2)  "+ session.getId());

		return "carshop/thankyou";
	}
	
	@GetMapping("/login")
	public String login() {
		//HttpSession session1 = request.getSession();
		
		//session1.invalidate();
		//System.out.println("여기 에서의 세션은 " +session1);
		//request.getSession(false);
		return "carshop/login";
	}
	
	@PostMapping("/login") 
	@ResponseBody
	public String login_success( HttpSession session,@RequestBody Login logvo) {
		String back = "";
		System.out.println("포스트 컨트롤러 로그인에서의 session값은? "+ session);
		System.out.println("login정보는  " + logvo);
		//입력받은 id,pw확인
		System.out.println("id = " + logvo.getId() + " pw = " + logvo.getPw());
		
		boolean result = loginservice.login(logvo.getId(), logvo.getPw(), session);
		
		if(result == true) {
			// 관리자페이지로 랜딩할경우
			if(logvo.getId() == "admin"){
				back = "0";
			}
			System.out.println("111111");
			back = "0";
		}else {
			System.out.println("22222");
			back = "-1";
		}
		return back;
	}
	  
	@GetMapping("/logout")
	public String login2(HttpSession session) {
		session.invalidate();
		System.out.println("세션아이디는 : " + session.getId());
//		request.getSession(true);    //사용자가 또 요청보내면 모든정보가 남아있다. 
		return "carshop/login";
	}
	
	
	@GetMapping("/indexlogin")
	public String indexlogin(HttpSession session) {
		String sessionid = session.getId();
		System.out.println("로그인성공해서 새로생긴 세션id  : " + sessionid);
		String memberId = (String)session.getAttribute("id");
		System.out.println("세션으로 아이디 가져오는지?" + memberId);
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
				System.out.println("id없다=======");
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


