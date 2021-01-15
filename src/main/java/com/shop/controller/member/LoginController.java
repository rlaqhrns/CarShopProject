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
		String result = loginservice.getId(logvo.getId());   //입력한 id와 같은 db안의 id를 찾아옴
		if(result == null) back="-1";						 //찾아온 id가 없으면 ajax로 경고문구띄움
		else back="2";										 //있으면 pw ajax로 넘어감(ajax끼리 동기통신중)
		return back;
	}
	
	@PostMapping("/onlyPw")
	@ResponseBody
	public String getAjaxPw(@RequestBody Login logvo) {
		String back = "";
		String result = loginservice.getPw(logvo.getId(), logvo.getPw());   //입력한 id와 매칭되는 pw를 찾아옴
		
		if(result == null) back="-1";	//로그인정보 불일치
		else back="2";       			//로그인정보 일치
		return back;
	}
	
	@PostMapping("/login") 
	@ResponseBody
	public String login_success( HttpSession session,@RequestBody Login logvo) {  //logvo에 ajax에서 받은 id,pw담김 
		String back = "";
		String result = loginservice.login(logvo.getId(), logvo.getPw(), session);
						//입력된 id,pw와 세션을 서비스에 전달 후 결과값을 담음
		
		//서비스로부터 받아온 결과값에 따라 ajax로 화면이동
		if(result == "1") back = "1";			//관리자로 로그인(관리자메뉴가 보임)
		else if(result == "2") back = "2";		//회원으로 로그인(일반로그인)
		else back = "-1";						//로그인정보가 틀릴경우(로그인페이지에 머무름)
		return back;
	}
	  
	@GetMapping("/logout")
	public String login2(HttpServletRequest request, HttpSession session) {
		session.invalidate();								//세션삭제
		HttpSession session1 = request.getSession(false);	//세션삭제여부 확인(session1을 찍어보면 null일경우 세션삭제)
		return "redirect:/carshop/index"; 		//return "carshop/index"로 두면 jsp만 보이고 컨트롤러는 실행이 안되서 물품들이 보이지 않음 (성연/21.01.14)
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
	
	@PostMapping("/pwsearch")   //pw찾는페이지에서 "인증메일받기"버튼클릭 시 실행
	@ResponseBody
	public boolean pwsearch2 (@RequestBody All_User_Tbl aut, Model model) {
		
		boolean result =false;
		
		String email = aut.getEmail();                      //사용자가 입력한 이메일
		All_User_Tbl db_id = loginservice.getid(email);		//db에 입력한 이메일이 있는지 확인후 해당 vo가져옴
			if(db_id == null) return result;				//db에 이메일이 없는경우 ajax로 false return
		String id = db_id.getId();							//가져온 vo에서 id만 추출

		try {
			String emailcheck = loginservice.getemail(aut);  //찾고자 하는 계정의 이메일을 db에 확인
			if(emailcheck == "1") {      					 //이메일이 db와 일치하는경우
				mailservice.sendMail(email, id);    		 //이메일발송메서드
				result = true;								 //ajax로 true리턴하여 alert띄움
			} else result= false;  	//이메일이  일치하지않거나,저장된 이메일이 없을때(ajax로 false반환하여 alert띄움)
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
	
	@PostMapping("/pwsetting2")     //이메일의 링크로이동한  pw재설정 페이지에서 새 비밀번호 받아옴
	public String pwsetting2(Login login, All_User_Tbl aut) {     //login에는 입력받은 비번, aut는 새로 db에 저장하기 위한 vo
//		String result = "";
		String email = login.getEmail();                    //새 비번을 setting하려는 자의 이메일
		String pw1 = login.getPw1();						//입력한 첫번째 비밀번호
		String pw2 = login.getPw2();						//입력한 두번째 비밀번호
															//비번2개가 일치해야 컨트롤러로 들어오게 코딩
		aut.setPw(login.getPw1());							//aut에 새롭게 비밀번호를 설정함
		//hidden으로 email정보를 가져온다.
		loginservice.pwsave(aut);							//DB에 비번 업데이트

		return "/carshop/login";
	}

	
}


