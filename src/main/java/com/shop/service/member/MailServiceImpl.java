package com.shop.service.member;

import java.util.Map;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.shop.handler.MailHandler;

//html + 이미지발송
@Service
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender mailsender;
	
	@Autowired
	public void sendMail() {
		try {
			MimeMessage msg = mailsender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true);
			helper.setTo("bomvll@naver.com");
			helper.setSubject("저리카shop 비밀번호 재설정메일");
			helper.setText("<!DOCTYPE html>\r\n" + 
					"<html lang=\"en\">\r\n" + 
					"<head>\r\n" + 
					"<meta charset=\"UTF-8\">\r\n" + 
					"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
					"<title>Document</title>\r\n" + 
					"<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n" + 
					"<link href=\"https://fonts.googleapis.com/css2?family=Do+Hyeon&amp;display=swap\" rel=\"stylesheet\">\r\n" + 
					"</head>\r\n" + 
					"<body>\r\n" + 
					"  <section style=\"border:1px solid white;width:440px;height:400px;box-shadow:1px 1px 5px rgb(216, 216, 216);margin-left:10px;font-family:'Do Hyeon', sans-serif;border-radius:10px;\"><div class=\"imgpart\" style>\r\n" + 
					"      <img align=\"center\" src=\"https://mail.naver.com/read/image/original/?mimeSN=1608692763.755173.21705.59136&amp;offset=1513&amp;size=21942&amp;u=bomvll&amp;cid=4eb86963e95e46ef6cda35a3efeb7bad@cweb011.nm.nfra.io&amp;contentType=image/png&amp;filename=1608692758787.png&amp;org=1\" style=\"margin-left : 20px;\">\r\n" + 
					"</div>\r\n" + 
					"    <div class=\"contents1\">\r\n" + 
					"      <p class=\"line1\" style=\"font-size:13px;font-family:'Do Hyeon', sans-serif;margin-bottom:0px;margin-left:10px;\">&#50504;&#45397;&#54616;&#49464;&#50836; ;-)</p>\r\n" + 
					"      <p class=\"line2\" style=\"font-size:15px;margin-top:5px;margin-bottom:45px;margin-left:10px;\">bomvll@naver.com &#45784;&#51032;  ID&#45716; <strong>\"borobom33\"</strong> &#51077;&#45768;&#45796;</p>\r\n" + 
					"    </div>\r\n" + 
					"    <div class=\"contents2\">\r\n" + 
					"      <p class=\"line3\" style=\"font-size:15px;margin-bottom:20px;margin-left:10px;\">&#50500;&#47000; &#48260;&#53948;&#51012; &#53364;&#47533;&#54616;&#49884;&#47732; &#48708;&#48128;&#48264;&#54840; &#51116;&#49444;&#51221;&#51060; &#44032;&#45733;&#54633;&#45768;&#45796;.</p>\r\n" + 
					"    </div>\r\n" + 
					"    <form class=\"btn\" action method=\"post\" style=\"height : 40px; width : 100px; border : none; border-radius: 7px; color : white; font-weight: bold; font-size: 13px;margin-bottom : 30px; margin-left : 10px;\">\r\n" + 
					"      <button class=\"btn\" type=\"submit\" style=\"background-color:#11b0be;height:40px;width:100px;border:none;border-radius:7px;color:white;font-weight:bold;font-size:13px;margin-bottom:30px;margin-left:10px;\">\r\n" + 
					"          &#48708;&#48128;&#48264;&#54840;&#48320;&#44221;\r\n" + 
					"      </button>\r\n" + 
					"    </form>\r\n" + 
					"    <div class=\"contents3\" style=\"margin-bottom: 150px; margin-top : 5px;\">\r\n" + 
					"      <p style=\"color: gray;\"><i>Copyright &#9426;2020 Zipcock, All rights reserved</i></p>\r\n" + 
					"    </div>\r\n" + 
					"    <h1>  </h1>\r\n" + 
					"    <h1>  </h1>\r\n" + 
					"    <h1>  </h1>\r\n" + 
					"  </section>\r\n" + 
					"</body>\r\n" + 
					"</html>", true);

			mailsender.send(msg);

		}catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}