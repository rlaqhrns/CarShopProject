package com.shop.controller.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.CategoryService;
import com.shop.vo.Cat_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class CategoryController {

	@Setter(onMethod_ = @Autowired)
	private CategoryService service;

	@RequestMapping("/cateChek")
	@ResponseBody
	public List<Cat_Tbl> cateChek(@RequestParam("cateId") int c_no, Model model) {
		model.addAttribute("cateCheck", service.cateCheck(c_no));
		System.out.println("카테고리 no = " + c_no);
		log.info(" 카테고리는 ?  " + service.cateCheck(c_no));
		return service.cateCheck(c_no);

	}

}
