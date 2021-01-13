package com.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.AnnclistMapper;
import com.shop.vo.Admin_Tbl;
import com.shop.vo.Annc_Tbl;

import lombok.Setter;

@Service
public class AnnclistServiceImpl implements AnnclistService {

	@Setter(onMethod_=@Autowired)
	protected AnnclistMapper amapper;
	
	@Override
	public List<Annc_Tbl> selectall() {
		return amapper.selectall(); 
	}

	@Override
	public int anncAdd(String title, String content) {
		return amapper.anncAdd(title, content);
	}

	@Override
	public Annc_Tbl selectLast() {
		return amapper.selectLast();
	}

	@Override
	public void updateTitle(String before_title, String after_title) {
		amapper.updateTitle(before_title, after_title);
	}

	@Override
	public void updateContent(String before_content, String after_content) {
		amapper.updateContent(before_content, after_content);
	}

	@Override
	public void delete(String date) {
		amapper.delete(date);
		
	}

	@Override
	public Admin_Tbl adminCheck(String admin) {
		// TODO Auto-generated method stub
		return amapper.adminCheck(admin);
	}

}
