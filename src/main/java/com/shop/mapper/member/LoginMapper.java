package com.shop.mapper.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.vo.All_User_Tbl;

public interface LoginMapper {
	public All_User_Tbl idpwcheck(String id);
	public All_User_Tbl emailcheck(String email);
	public All_User_Tbl getid(String email);
	public int updatepw(All_User_Tbl aut);
}
