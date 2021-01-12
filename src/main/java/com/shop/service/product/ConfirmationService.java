package com.shop.service.product;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Return_End_Tbl;
import com.shop.vo.Return_Tbl;
import com.shop.vo.User_Tbl;

public interface ConfirmationService {
	
	public List<Order_Histroy_Tbl> orderList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> formList(String u_id); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> orderListDate(String u_id, String order_date); //유저의 결제 목록 (재원/20.12.30)
	public List<Order_Histroy_Tbl> orderEventLists(String u_id, String order_date, int ono);
	public Order_Histroy_Tbl getReturn(int ono); //교환 폼 가져오기 (재원/21.01.07)
	public Prod_Tbl findSid(int p_no); //상품번호로 판매자 확인 (재원/21.01.07)
	public void insertForms(Return_Tbl returntbl); //교환 반품 폼 작성시 교환 반품 db로 insert (재원/21.01.07)
	public List<Prod_Tbl> findList(int p_no); //상품번호로 판매자 확인 (재원/21.01.07)
	public boolean returnOne(int ono); //교환 반품 테이블로 들어갔는지 확인 (재원/21.01.11)
	public List<Return_Tbl> findRefund(String u_id); //아이디로 교환폼 확인 (재원/21.01.12)
	public List<User_Tbl> isUser(String u_id); //아이디로 교환폼 확인 (재원/21.01.12)
	public List<Return_End_Tbl> findrealRefund(String u_id); //아이디로 환불 확인 (재원/21.01.12)
}
