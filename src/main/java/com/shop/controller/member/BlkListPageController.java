package com.shop.controller.member;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.service.member.BlackListService;
import com.shop.vo.Black_Tbl;
import com.shop.vo.Criteria;
import com.shop.vo.BlkPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/carshop/*")
@Slf4j
@AllArgsConstructor
public class BlkListPageController {
	
	@GetMapping("/blacklist")
	public String list(Model model) {

		int[] nums = {0,1,2,3,4,5,6,7,8,9}; //number counts for jtsl foreach grammar -SungYeon 20.12.23
		model.addAttribute("blkcnt", nums);
		
		return"carshop/blacklist";  //opening black list page -SungYeon 20.12.23
	}

}
