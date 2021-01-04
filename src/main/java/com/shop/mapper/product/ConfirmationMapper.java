package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Order_Histroy_Tbl;

public interface ConfirmationMapper {
	
	/*
	 * =============================================
	 * 
	 *                   결제 내역 맵핑
	 *                   
	 * ==============================================
	 * 1. 최신순으로 구입물품 날짜별 정렬 
	 * 2. 달력 api 가져오기
	 * 3. 교환 반품시 교환 반품 db로 insert
	 */
	
	public List<Order_Histroy_Tbl> orderList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	
}
