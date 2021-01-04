package com.shop.service.member;

import java.util.Map;

import javax.mail.MessagingException;

public interface MailService  {
//	public Map<String, Object> send(String email, String title, String body);
	
	public void sendMail() throws MessagingException;
}
