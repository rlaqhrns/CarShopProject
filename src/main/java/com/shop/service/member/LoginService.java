package com.shop.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.vo.All_User_Tbl;

public interface LoginService {
	public boolean login( String id, String pw, HttpSession session);
	public String getemail(All_User_Tbl aut);
}
