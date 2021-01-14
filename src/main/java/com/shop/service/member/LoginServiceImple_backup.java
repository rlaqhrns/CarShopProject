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
import com.shop.vo.Admin_Tbl;
import com.shop.vo.All_User_Tbl;

import javax.swing.JButton;
import javax.swing.JFrame;
import java.awt.FlowLayout;

import lombok.Setter;

@Service
public class LoginServiceImple_backup implements LoginService{
	
	@Setter(onMethod_=@Autowired)
	protected LoginMapper logmapper;
	
	private String id;
	private String pw;
	private HttpSession session;
	private Admin_Tbl db_admin;
	private All_User_Tbl db_id;
	
	@Override
	public String login(String id, String pw, HttpSession session)  {
		try { //입력된 id/pw가 일반유저 or 관리자 테이블과 일치하는지 각자 확인
			if(logmapper.getAdmin(id) != null) {
				db_admin = logmapper.getAdmin(id);                 //admin_tbl에 아이디있는지 확인
				String resultAdmin = admin(id, pw, db_admin.getId(), session);       //관리자 세션생성되면 "1"을 반환
				System.out.println("login service 관리자 세션 다음단계 : " + resultAdmin);
				return resultAdmin;         //"1"(관리자세션생성 성공)
			}
			if(logmapper.idpwcheck(id) != null) {
				All_User_Tbl db_id = logmapper.idpwcheck(id);         //all_user_tbl에 아이디 있는지 확인
				//db와 정보가 다를경우
					if(db_id != null) {  
						String resultNormalUser = normalUser(id, pw, db_id.getId(), session);   //일반유저 세션생성시 "2"반환
						System.out.println("login service 일반회원 세션 다음단계 : " + resultNormalUser);
						return resultNormalUser; //"2"
					}else {
						return "-1";
					}   
			}
			return "-1";
		} catch(Exception e) {
			System.out.println("로그인실패");
			e.printStackTrace();
			return "-1";
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
	
	@Override
	public String getId(String id) {
		try {
			System.out.println("db에서 아이디만! 가져와");
			String getId = logmapper.getIdById(id).getId();
			System.out.println("db에서 아이디만! 가져왔다  " + getId);
			return getId;
		
		}catch(Exception e) {
			System.out.println("아이디만 가져오려고했는데, null이라서 암것도없어");
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	@Override
	public String getPw(String id, String pw) {
		
		try {
			System.out.println("db에서 pw만! 가져와 / db에서 호출할 id는 : " + id);
			String getPw = logmapper.getIdById(id).getPw();
			System.out.println("db에서 pw만! 가져왔다  " + getPw);
			if(getPw.equals(pw)) {
				return "2";
			}
			return null;
			
		}catch(Exception e) {
			System.out.println("pw만 가져오려고했는데, null이라서 암것도없어");
			e.printStackTrace();
			return null;
		}
		
	}

	
	
	//관리자 세션생성메서드
	public String admin(String id, String pw, String db_admin, HttpSession session) {
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);
			session.setAttribute("user", db_admin);
			return "1";
	}
	
	//일반유저 세션생성메서드
	public String normalUser(String id, String pw, String db_id, HttpSession session) {
		
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);
			session.setAttribute("user", db_id);
			return "2";

	}
}
