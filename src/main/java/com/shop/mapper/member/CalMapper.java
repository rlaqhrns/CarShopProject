package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.CalendarVO;


public interface CalMapper {
	public List<CalendarVO> getschd(String u_id); //아이디에 맞는 스케줄 가져옴 -Monica 2020.12.31
	
	public void insertSchd(CalendarVO calVO); //스케쥴 db에 입력 -Monica 2020.12.31
	
	public int deleteSchd(String u_id, String schdtitle);  //아이디와 일정제목으로 일정 삭제 -Monica 2020.12.31
}
