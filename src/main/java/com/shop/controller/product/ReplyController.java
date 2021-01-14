package com.shop.controller.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.service.product.AskService;
import com.shop.service.product.ReplyService;
import com.shop.vo.Ask_Tbl;
import com.shop.vo.Reply_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/carshop/*")
public class ReplyController {
	private static final String FILE_SERVER_PATH = "E:\\GreenComputerPro\\CarShopProject\\src\\main\\webapp\\resources\\img\\replyUpload";
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;

	
	
	
	@PostMapping("/product/replyForm")
	public String reply_form(@RequestParam("img")MultipartFile[] file,Reply_Tbl reply,Model model) throws IllegalStateException, IOException {
		
		try {
			System.out.println("file : " +file.length);
			System.out.println("빈값체크" + file[0].isEmpty());
			System.out.println("file 의 이름 : " + file[0].getOriginalFilename() );


			UUID uuid = UUID.randomUUID();
			String msg = uuid.toString().substring(0, 5);
			
			if(file.length ==1) {
				if(file[0].getOriginalFilename().equals("")) {
					System.out.println("빈값입니다");;
					reply.setR_img1(null);
				}else {
					reply.setR_img1((msg + file[0].getOriginalFilename()));  

				}
			}else if(file.length ==2) {
				reply.setR_img1(msg + file[0].getOriginalFilename());  
				reply.setR_img2(msg + file[1].getOriginalFilename());
			}else if(file.length ==3) {
				reply.setR_img1(msg + file[0].getOriginalFilename());  
				reply.setR_img2(msg + file[1].getOriginalFilename());
				reply.setR_img3(msg + file[2].getOriginalFilename());
			}
			for(int i =0; i<file.length; i++) {
				file[i].transferTo(new File(FILE_SERVER_PATH, msg + file[i].getOriginalFilename()));

			}
			
			service.replyForm(reply);;

			return "redirect:/carshop/product/details?p_no="+reply.getP_no();
		} catch (Exception e) {
			return "redirect:/carshop/error";
		}

		
		
	}
	

	

}
