package com.shop.controller.product;

import java.io.File;
import java.io.IOException;
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
		String id = session.getId();
		System.out.println("id : " + id);
		model.addAttribute("cateParent", service.cateParent());
		model.addAttribute("category", service.category());
		return "carshop/productForm";
	}

	// action
	@PostMapping("/productForm")
	public String register(@RequestParam("img1") MultipartFile[] file, Prod_Tbl product, Model model)
			throws IllegalStateException, IOException {
		String result = "";
		for (int i = 0; i < file.length; i++) {
			UUID uuid = UUID.randomUUID();
			String msg = uuid.toString().substring(0, 5);
			System.out.println("uuid : " + msg);
			System.out.println("empty : " + file[i].isEmpty());	
			System.out.println("file name : " + file[i].getOriginalFilename());
			result += "," + msg + file[i].getOriginalFilename();
			// File 객채를 생성하고 첫번째 인자값은 파일의 경로, 두번재 인자값은 파일의 이름
			file[i].transferTo(new File(FILE_SERVER_PATH, msg + file[i].getOriginalFilename()));
		}
		result = result.substring(1);
		product.setImg(result);
		System.out.println("product 값 : " + product);
		log.info("product 매개변수 값 : " + product);
		productService.productForm(product);
		return "redirect:/carshop/index";
	}

}