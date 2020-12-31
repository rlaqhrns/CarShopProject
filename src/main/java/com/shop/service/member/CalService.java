package com.shop.service.member;

import java.util.List;

import com.shop.vo.CalendarVO;

public interface CalService {
	public List<CalendarVO> getschdList(String u_id);
	
	public void recordSchd(CalendarVO calVO);
	
	public int removeSchd(String u_id, String schdtitle);

}
