package com.shop.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.mapper.member.CalMapper;
import com.shop.vo.CalendarVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CalServiceImpl implements CalService{
	
	private CalMapper calmapper;  //캘린더매퍼 호출 -Monica 2020.12.31

	@Override
	public List<CalendarVO> getschdList(String u_id) {
		
		return calmapper.getschd(u_id);
	}

	@Override
	public void recordSchd(CalendarVO calVO) {
		calmapper.insertSchd(calVO);
		
	}

	@Override
	public int removeSchd(String u_id, String schdtitle) {
	
		return calmapper.deleteSchd(u_id, schdtitle);
	}
	
	

}
