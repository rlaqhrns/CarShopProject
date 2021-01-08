package com.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Return_Tbl;

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
	 * 3-1. 판매자 가져오기 
	 */
	
	public List<Order_Histroy_Tbl> orderList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> orderDateLists(@Param("u_id") String u_id, @Param("order_date") String order_date); //유저의 날짜별 결제 목록 (재원/20.12.30)
	public Order_Histroy_Tbl getReturn(@Param("ono") int ono); //교환 폼 가져오기 (재원/21.01.07)
	public Prod_Tbl findSid(@Param("p_no") int p_no); //상품번호로 판매자 확인 (재원/21.01.07)
	public List<Prod_Tbl> findList(@Param("p_no") int p_no); //상품번호로 판매자 확인 (재원/21.01.07)
	public void insertForms(Return_Tbl returntbl); //교환 반품 폼 작성시 교환 반품 db로 insert (재원/21.01.07)
	public Return_Tbl returnOne(Return_Tbl returntbl);
}
