package com.shop.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.vo.Admin_Tbl;
import com.shop.vo.All_User_Tbl;

public interface LoginService {
	public String login( String id, String pw, HttpSession session);
	public String getemail(All_User_Tbl aut);
	public All_User_Tbl emailcheck(String email);
	public All_User_Tbl getid(String email);
	public void pwsave(All_User_Tbl aut);
}
