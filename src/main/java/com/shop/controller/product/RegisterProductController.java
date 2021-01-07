package com.shop.controller.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shop.service.product.CategoryService;
import com.shop.service.product.RegisterProductService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class RegisterProductController {

	private static final String FILE_SERVER_PATH = "C:\\Users\\ssw74\\git\\CarShopProject\\src\\main\\webapp\\resources\\img\\upload";

	@Setter(onMethod_ = @Autowired)
	private CategoryService service;
	@Setter(onMethod_ = @Autowired)
	private RegisterProductService productService;

	@GetMapping("/productForm")
	public String productForm(Model model, HttpSession session) {
		model.addAttribute("cateParent", service.cateParent());
		model.addAttribute("category", service.category());
		model.addAttribute("user", session.getAttribute("id"));
		System.out.println("user : " + session.getAttribute("id"));
		return "carshop/productForm";
	}

	// action
	@PostMapping("/productForm")
	public String register(MultipartHttpServletRequest multipartRequest, Prod_Tbl product, Model model)
			throws IllegalStateException, IOException {
		// @RequestPram("prod_img")
		UUID uuid = UUID.randomUUID();
		String msg = uuid.toString().substring(0, 5);
		List<MultipartFile> fileList = multipartRequest.getFiles("prod_img");
		List<String> arrayList = new ArrayList<String>();
		System.out.println("list 의 사이즈 : " + fileList.size());
//		for (MultipartFile file : fileList) {
//			arrayList.add(msg + file.getOriginalFilename());
//			file.transferTo(new File(FILE_SERVER_PATH, msg + file.getOriginalFilename()));
//		}
//		product.setImgList(arrayList);

		int fileSize = fileList.size() - 1;

		for (int i = 0; i < 3; i++) {
			 
			if (i <= fileSize) {
				arrayList.add(msg +fileList.get(i).getOriginalFilename());
				fileList.get(i).transferTo(new File(FILE_SERVER_PATH, msg + fileList.get(i).getOriginalFilename()));
			} else {
				arrayList.add(null);
			}

		}
		product.setImgList(arrayList);


//			System.out.println("file : " +file.length);
//			UUID uuid = UUID.randomUUID();
//			String msg = uuid.toString().substring(0, 5);
//			
//			if(file.length ==1) {
//				product.setImg1(msg + file[0].getOriginalFilename());  
//			}else if(file.length ==2) {
//				product.setImg1(msg + file[0].getOriginalFilename());  
//				product.setImg2(msg + file[1].getOriginalFilename());
//			}else if(file.length ==3) {
//				product.setImg1(msg + file[0].getOriginalFilename());  
//				product.setImg2(msg + file[1].getOriginalFilename());
//				product.setImg3(msg + file[2].getOriginalFilename());
//			}
//			
////			product.setImg1(msg + file[0].getOriginalFilename());  
////			product.setImg2(msg + file[1].getOriginalFilename());
////			product.setImg3(msg + file[2].getOriginalFilename());
//			
//			// File 객채를 생성하고 첫번째 인자값은 파일의 경로, 두번재 인자값은 파일의 이름
//			for(int i =0; i<file.length; i++) {
//				file[i].transferTo(new File(FILE_SERVER_PATH, msg + file[i].getOriginalFilename()));
//
//			}
		productService.productForm(product);

		log.info("product 매개변수 값 : " + product);
		return "redirect:/carshop/index";
	}

}