package com.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Return_End_Tbl;
import com.shop.vo.Return_Tbl;
import com.shop.vo.User_Tbl;

public interface ConfirmationMapper {
	
	public List<Order_Histroy_Tbl> orderList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> formList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> orderDateLists(@Param("u_id") String u_id, @Param("order_date") String order_date); //유저의 날짜별 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> orderEventLists(@Param("u_id") String u_id, @Param("order_date") String order_date, @Param("ono") int ono);
	public void insertForms(Return_Tbl returntbl); //교환 반품 폼 작성시 교환 반품 db로 insert (재원/21.01.07)
	public Return_Tbl returnOne(@Param("ono") int ono); //교환 반품 테이블로 들어갔는지 확인 (재원/21.01.11)
	public List<Return_Tbl> findRefund(String u_id); //아이디로 교환폼 확인 (재원/21.01.12)
	public List<Return_End_Tbl> findrealRefund(String u_id); //아이디로 환불 확인 (재원/21.01.12)
	public User_Tbl isUser(String u_id); //아이디 예외처리(재원/21.01.13)

}
