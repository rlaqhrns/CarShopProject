package com.shop.service.member;

import java.util.List;

import com.shop.vo.Admin_Tbl;
import com.shop.vo.Annc_Tbl;

public interface AnnclistService {

	public List<Annc_Tbl> selectall();
	public int anncAdd(String title, String content);
	public Annc_Tbl selectLast();
	public void updateTitle(String before_title, String after_title);
	public void updateContent(String before_content, String after_content);
	public void delete(String date);
	public Admin_Tbl adminCheck(String admin);
}
