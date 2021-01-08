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
			if(id == "admin" && pw == "admin") {           //관리자로 로그인
				return true;
				}
		//id+pw를 db와 비교	
		All_User_Tbl db_id = logmapper.idpwcheck(id);

			//로그인성공하면 세션생성
			if(id.equals(db_id.getId()) && pw.equals(db_id.getPw())) {  
	
				session.setAttribute("sesisonId" , id);
				session.setAttribute("sesisonPw", pw);

				return true;
			} else {
				return false;
			}
			
		} catch(Exception e) {
//			System.out.println("로그인실패");
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
	
	//세션정보로 email,id값을 가진상태여야 함
	//새 비밀번호를 db에 저장
	@Override
	public void pwsave(All_User_Tbl aut) {
		System.out.println("service==========");
		logmapper.updatepw(aut);
	}
	
}
