package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.AskPrintVO;
import com.shop.vo.Criteria;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface MyPageMapper {
	public int getAskCnt(String s_id, String u_id); //문의 갯수 조회
	public List<AskPrintVO> getAskWithPaging(Criteria crit, String s_id, String u_id);  //문의 목록 조회
	//public String checkId(String user);
	public List<Prod_Tbl> getproducts(); //조회주 높은 상품 4개조회
	public Seller_Tbl getseller(String s_id);  //셀러정보 조회
	public User_Tbl getuser(String u_id);  //일반유저 정보 조회
	
	public void updatebsns(String b_no, String b_name, String s_id);  //s_id로 조회하여 bno, bname 업데이트 -성연 2021.01.07

}
