package com.shop.service.member;

import java.util.Map;

import javax.mail.MessagingException;

import com.shop.vo.All_User_Tbl;

public interface MailService  {
//	public Map<String, Object> send(String email, String title, String body);
	
	public void sendMail(String mail, String id) throws MessagingException;
}
