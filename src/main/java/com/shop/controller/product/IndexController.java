package com.shop.controller.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.controller.HomeController;
import com.shop.service.CarShopService;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/carshop/*")
@Slf4j
public class IndexController {
	
	@Setter(onMethod_ = @Autowired)
	private CarShopService service;
	
	@RequestMapping({ "/", "index" })
	public String index(Model model) {
		model.addAttribute("list", service.index());

		return "carshop/index";

	}

}
