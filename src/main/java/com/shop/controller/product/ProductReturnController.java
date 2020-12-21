package com.shop.controller.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.product.ProductReturnService;
import com.shop.service.product.ProductReturnServiceImple;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class ProductReturnController {

	@Setter(onMethod_ = @Autowired)
	private ProductReturnService service;

	@RequestMapping("/retrun_end")
	public String return_end(Model model) {
		model.addAttribute("list", service.retrun_());
		System.out.println("援먰솚諛섑뭹�럹�씠吏� �뱾�뼱�샂 ");
		log.info("由ъ뒪�듃" + service.retrun_());
		return "carshop/return_end";
	}

}
