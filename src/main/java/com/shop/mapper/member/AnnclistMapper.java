package com.shop.mapper.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.Annc_Tbl;

public interface AnnclistMapper {

	public List<Annc_Tbl> selectall(); 
	public int anncAdd(@Param("title") String title, @Param("content") String content);
	public void updateTitle(@Param("before_title") String before_title, @Param("after_title") String after_title);
	public int updateContent(@Param("before_content") String before_content, @Param("after_content") String after_content);
	public Annc_Tbl selectLast();
	public void delete(String date);
}
