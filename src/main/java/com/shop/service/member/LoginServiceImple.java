package com.shop.service.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.LoginMapper;
import com.shop.vo.All_User_Tbl;

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
	
				String memberId = (String)session.getAttribute("id");
				boolean login = memberId == null ? false : true;
				
//				System.out.println("memberId는 : " + memberId);
//				System.out.println("login세션결과는 : " + login);		
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

	
	@Override
	public String getemail(All_User_Tbl aut) {
		String email = aut.getEmail();
//		System.out.println("입력받은 email은  " + email);

		
		try {
			All_User_Tbl db_vo = logmapper.emailcheck(email);
//			System.out.println("db에 저장된 vo객체는   " + db_vo);
			
			String db_email = db_vo.getEmail();
//			System.out.println("db에 저장된 vo객체중 이메일만 추출하면    " + db_email);
			
			if(email.equals(db_email)) {
				return "1";
			}else {
				return "-1";
			}
		}catch(Exception e) {
			//일치하는 이메일이 없는경우 실행
			return "0";
		}
	}
	
	
}
