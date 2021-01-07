package com.shop.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.vo.All_User_Tbl;

public interface LoginService {
	public boolean login( String id, String pw, HttpSession session);
	public String getemail(All_User_Tbl aut);
	public All_User_Tbl emailcheck(String email);
	public All_User_Tbl getid(String email);
//	public boolean pwsetting(String pw1, String pw2);
	public void pwsave(All_User_Tbl aut);

}
