package com.shop.service.member;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import com.shop.handler.MailHandler;
import com.shop.vo.All_User_Tbl;

//html + 이미지발송
@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailsender;
	
	public void sendMail(String mail, String id) throws MessagingException {
			MimeMessage msg = mailsender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true);
			helper.setTo(mail);
			helper.setSubject("저리카shop 비밀번호 재설정메일");
			
			String a = "<!DOCTYPE html>\r\n" + 
					"<html lang=\"en\">\r\n" + 
					"<head>\r\n" + 
					"<meta charset=\"UTF-8\">\r\n" + 
					"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
					"<title>Document</title>\r\n" + 
					"<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n" + 
					"<link href=\"https://fonts.googleapis.com/css2?family=Do+Hyeon&amp;display=swap\" rel=\"stylesheet\">\r\n" + 
					"</head>\r\n" + 
					"<body>\r\n" + 
					"  <section style=\"border: 1px solid white;\r\n" + 
					"      width:440px;\r\n" + 
					"      height:400px;\r\n" + 
					"      box-shadow:1px 1px 5px rgb(216, 216, 216);\r\n" + 
					"      margin-left:10px;\r\n" + 
					"      font-family:'Do Hyeon', sans-serif;\r\n" + 
					"      border-radius:10px;\"><div class=\"one\">\r\n" + 
					"      <img src=\"https://mail.naver.com/read/image/original/?mimeSN=1608692763.755173.21705.59136&amp;offset=1513&amp;size=21942&amp;u=bomvll&amp;cid=4eb86963e95e46ef6cda35a3efeb7bad@cweb011.nm.nfra.io&amp;contentType=image/png&amp;filename=1608692758787.png&amp;org=1\" alt style=\"text-align : center;\r\n" + 
					"      margin-top: 10px;\r\n" + 
					"      margin-left : 15px;\r\n" + 
					"      width : 413px;\r\n" + 
					"      height : 216px;\">\r\n" + 
					"</div>\r\n" + 
					"    <span class=\"line1\" style=\"width : 300px;\r\n" + 
					"      font-size: 20px;\r\n" + 
					"      font-size:13px;\r\n" + 
					"      font-family:'Do Hyeon', sans-serif;\r\n" + 
					"      margin-top:20px;\r\n" + 
					"      margin-left:12px;\">&#50504;&#45397;&#54616;&#49464;&#50836;:-)</span><br><span class=\"line11\" style=\"margin-left:12px;\"></span>";
			String b =  mail;
			String c = "<span class=\"line2\" style=\"width : 200px;\r\n" + 
					"      font-size:10px;\r\n" + 
					"      margin-top : 5px;\r\n" + 
					"      margin-left:15px;\">&#45784;&#51032; ID&#45716;   &#12288;\"</span>";
			String d = id;
			String e ="<span class=\"line3\" style=\"font-size:10px;\r\n" + 
					"      margin-top:px;\r\n" + 
					"      margin-bottom:px;\">\"   &#51077;&#45768;&#45796;.</span>\r\n" + 
					" \r\n" + 
					"    <div class=\"three\">\r\n" + 
					"      <p class=\"guide\" style=\"font-size:13px;\r\n" + 
					"      margin-top: 45px;\r\n" + 
					"      margin-left:15px;\r\n" + 
					"      margin-bottom: 7px;\r\n" + 
					"      font-family:'Do Hyeon', sans-serif;\">&#50500;&#47000; &#48260;&#53948;&#51012; &#53364;&#47533;&#54616;&#49884;&#47732; &#48708;&#48128;&#48264;&#54840; &#51116;&#49444;&#51221;&#51060; &#44032;&#45733;&#54633;&#45768;&#45796;.</p>\r\n" + 
					"    </div>\r\n" + 
					"    <form action=\"http://localhost:1234/carshop/pwsetting\" method=\"post\">\r\n" + 
					"      <input type=\"hidden\" name=\"email\" value=\"";
			String f = mail;
			String g = "\"><button type=\"submit\" class=\"btn\" style=\"background-color:#11b0be;\r\n" + 
					"      height:40px;\r\n" + 
					"      width:100px;\r\n" + 
					"      border:none;\r\n" + 
					"      border-radius:7px;\r\n" + 
					"      color:white;\r\n" + 
					"      font-weight:bold;\r\n" + 
					"      font-size:13px;\r\n" + 
					"      margin-left:20px;\">\r\n" + 
					"        &#48708;&#48128;&#48264;&#54840;&#48320;&#44221;\r\n" + 
					"      </button>\r\n" + 
					"    </form>\r\n" + 
					"    <div class=\"four\" style=\"margin-bottom: 150px; \r\n" + 
					"      margin-top : 5px;\">\r\n" + 
					"      <p class=\"copyright\" style=\"margin-top: 30px;\r\n" + 
					"      color: gray;\"><i>Copyright &#9426;2020 Zipcock, All rights reserved</i></p>\r\n" + 
					"    </div>\r\n" + 
					"    <br><br><br></section>\r\n" + 
					"</body>\r\n" + 
					"</html>";
			helper.setText(a+b+c+d+e+f+g, true);
			mailsender.send(msg);

	}
	
}