package com.shop.controller.member;

import java.util.List;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shop.service.member.BlackListService;
import com.shop.vo.Black_Tbl;
import com.shop.vo.Criteria;
import com.shop.vo.BlkPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController    //to use RESTmapping system -SungYeon 20.12.23
@RequestMapping("/carshop/*")
@Slf4j
@AllArgsConstructor
public class BlackListController {
	
	//creating service object -SungYeon 20.12.23
	private BlackListService blk_service;
	
	//Mapping that is getting black list data for ajax communication -SungYeon 20.12.23
	@GetMapping(value = "/blacklista", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<BlkPageDTO> blklist(int pageNum){
		//System.out.println("get blk list.....");
		Criteria crit = new Criteria();
		crit.setPageNum(pageNum);
		//System.out.println("crit: " + crit);
		// Important!!! calculation set index to mysql standard, which is 0 -SungYeon 20.12.23
		crit.setStartNum((crit.getPageNum()-1)*crit.getAmount()); //ex: when page is 1, data starts from / when page is 2, data starts from 1*amount -SungYeon 20.12.23
		//System.out.println("crit: " + crit);
		
		return new ResponseEntity<>(blk_service.getBlkList(crit), HttpStatus.OK);
	}
	
	//Mapping that allows ajax to remove receiving id from black list tbl(not deleting id from all user tbl) -SungYeon 20.12.23
	@DeleteMapping(value = "/blkremove/{s_id}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeblk(@PathVariable("s_id") String s_id) {
		System.out.println("s_id = " + s_id);
		
		
		return blk_service.blkremove(s_id) == 1 ?  //mapper.xml에 delete태그를 썼으므로 리턴타입은 int, 리턴값은 1 -성연 20.12.23
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//Mapping that allows ajax to remove receiving id from all user tbl and seller tbl -SungYeon 20.12.23
	@DeleteMapping(value = "/blkdelete/{s_id}", produces = MediaType.TEXT_PLAIN_VALUE)  //패스에 붙여 받아 특수문자에 영향받지 않도록 수정 -성연 20.01.12
	public ResponseEntity<String> deleteblk(@PathVariable("s_id") String s_id){
		System.out.println("s_id = " + s_id);
		int a= blk_service.blkremove(s_id); //removing this id from black list tbl -SungYeon 20.12.23
		
		//removing this id from all user tbl and seller tbl -SungYeon 20.12.23
		//if success, return true, if not, return false  -SungYeon 20.12.23
		return blk_service.delete_allnseller(s_id) == true ?  
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	
	
}
