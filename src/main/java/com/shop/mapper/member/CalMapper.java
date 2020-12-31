package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.CalendarVO;


public interface CalMapper {
	public List<CalendarVO> getschd(String u_id);
	
	public void insertSchd(CalendarVO calVO);
	
	public int deleteSchd(String u_id, String schdtitle);
}
