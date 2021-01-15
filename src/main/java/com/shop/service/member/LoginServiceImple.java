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
public class LoginServiceImple implements LoginService{
	
	@Setter(onMethod_=@Autowired)
	protected LoginMapper logmapper;
	
	private String id;
	private String pw;
	private HttpSession session;
	private Admin_Tbl db_admin;
	private All_User_Tbl db_id;
	
	@Override
	public String login(String id, String pw, HttpSession session)  {
		try { 
			if(logmapper.getAdmin(id) != null) {		//입력된 정보가 관리자인지 확인
				db_admin = logmapper.getAdmin(id);                		 //admin_tbl에 아이디있는지 확인
				String resultAdmin = admin(id, pw, db_admin, session);   //관리자메서드에서 세션생성되면 "1"을 반환
				return resultAdmin;        								 //"1"(관리자세션생성 성공)
			}
			if(logmapper.idpwcheck(id) != null) {		//입력된 정보가 일반유저인지 확인
				 db_id = logmapper.idpwcheck(id);  	    //all_user_tbl에 아이디 있는지 확인
					if(db_id != null) {  				//db에 아이디가 있을경우
						String resultNormalUser = normalUser(id, pw, db_id, session); //일반유저메서드에서 세션생성되면 "2"반환
						return resultNormalUser; 		//"2"
					}else {
						return "-1"; 				
					}   
			}
			return "-1";			//가입된 id값이 없는경우
		} catch(Exception e) {
			e.printStackTrace();
			return "-1";			//가입된 id값이 없는경우
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
		logmapper.updatepw(aut);
	}
	
	@Override
	public String getId(String id) {
		
		Admin_Tbl adminInfo = logmapper.getAdmin(id);
		All_User_Tbl userInfo = logmapper.getIdById(id);
		
		try {
			if(adminInfo != null) { 				  //작성한 아이디가 admin인 경우 확인
				String db_admin = adminInfo.getId();  //관리자 정보중 id만 추출
				if(id.equals(db_admin)) return "2";	  //db id와 입력받은 id의 일치여부 확인
				return null;
			}
			if(userInfo != null) {          		//작성한 아이디가 normalUser인 경우 확인
				String getId = userInfo.getId();	//유저정보중 id만 추출
				if(id.equals(getId)) return "2";	//db id와 입력받은 id의 일치여부 확인	
				return null;
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	@Override
	public String getPw(String id, String pw) {
		
		Admin_Tbl adminInfo = logmapper.getAdmin(id);
		All_User_Tbl userInfo = logmapper.getIdById(id);
		
		try {
			if(adminInfo != null) {          		    //입력값이 관리자인지 확인
				String db_admin = adminInfo.getPw();  	//관리자 정보중 비번만 추출
				if(pw.equals(db_admin)) return "2";	    //db비번과 입력받은 번호의 일치여부 확인
				return null;
			}
			if(userInfo != null) { 				    //입력값이 일반유저인지 확인
				String getPw = userInfo.getPw();	//유저정보중 비번만 추출
				if(getPw.equals(pw)) return "2";	//db비번과 입력받은 번호의 일치여부 확인	
				return null;
			}
			return null;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	
	
	//관리자 세션생성메서드
	public String admin(String id, String pw, Admin_Tbl db_admin, HttpSession session) {
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);
			session.setAttribute("user", db_admin);
			return "1";
	}
	
	//일반유저 세션생성메서드
	public String normalUser(String id, String pw, All_User_Tbl db_id, HttpSession session) {
		
			session.setAttribute("id" , id);
			session.setAttribute("pw", pw);
			session.setAttribute("user", db_id);
			return "2";

	}
}
