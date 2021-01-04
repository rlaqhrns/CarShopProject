package com.shop.service.member;

import java.awt.FlowLayout;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.LoginMapper;
import com.shop.vo.All_User_Tbl;

import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.FlowLayout;

import lombok.Setter;

@Service
public class LoginServiceImple implements LoginService{
	
	@Setter(onMethod_=@Autowired)
	protected LoginMapper logmapper;
	
	@Override
	public boolean login(String id, String pw, HttpSession session) {

		try {
			
//			if(id == "admin" && pw == "admin") {           //관리자로 로그인 시 프리패스
//				return true;
//			}
			
		All_User_Tbl db_id = logmapper.idpwcheck(id);
		
//		System.out.println("id는 : " + id + "pw는" + pw );
//		System.out.println("dbid는 : " + db_id.getId() + "  dbpw는" + db_id.getPw() );
		
			//로그인성공하면 세션생성
			if(id.equals(db_id.getId()) && pw.equals(db_id.getPw())) {  
	
				session.setAttribute("id" , id);
				session.setAttribute("pw", pw);
				
				String sessionid = session.getId();
				System.out.println("세션아이디는  : " + sessionid);
	
				String memberId = (String)session.getAttribute("id");
				boolean login = memberId == null ? false : true;
				
				System.out.println("memberId는 : " + memberId);
				System.out.println("login세션결과는 : " + login);		
				return true;
			} else {
				return false;
			}
			
		} catch(Exception e) {
//			System.out.println("로그인실패================");
			e.printStackTrace();
			return false;
		}
	}

	//id,pw찾을때 사용할 emailcheck
	@Override
	public String getemail(All_User_Tbl aut) {

		String email = aut.getEmail();
		
		try {
			All_User_Tbl db_vo = logmapper.emailcheck(email);
				if(db_vo == null) {
					return "-1";  //일치하는이메일없을때
				}
			String db_email = db_vo.getEmail();
			
			if(email.equals(db_email)) {
				return "1";
			}else {
				return "-1";      //db에 이메일이 저장되있긴한데, 내가쓴이메일과 일치하지않을때
			}
		}catch(Exception e) {
			//일치하는 이메일이 없는경우 실행
			return "0";
		}
	}
	
	//pwsetting에 email제공
	@Override
	public All_User_Tbl emailcheck(String email) {
		return  logmapper.emailcheck(email);
	}
	
	//비번재설정 메일에 포함될 id가져오기
	@Override
	public All_User_Tbl getid(String email) {
		All_User_Tbl id = logmapper.getid(email);
		return id;
	}
	
	//비밀번호가 같은지 확인, 안썼는지 확인
//	@Override
//	public boolean pwsetting(String pw1, String pw2) {
//		
//		if(pw1 == "" || pw2 == "" || pw1 != pw2) {
//			return false;
//		}else {
//			return true;
//		}
//	}
	
	//세션정보로 email,id값을 가진상태여야 함
	//새 비밀번호를 db에 저장
	@Override
	public void pwsave(All_User_Tbl aut) {
		System.out.println("service==========");
		logmapper.updatepw(aut);
	}
	
}
