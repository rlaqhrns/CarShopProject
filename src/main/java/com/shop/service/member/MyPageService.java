package com.shop.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.shop.vo.Criteria;
import com.shop.vo.MyAskPageDTO;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface MyPageService {
	public MyAskPageDTO getAskList(Criteria crit, String s_id, String u_id);  //문의목록출력에 필요한 데이터를 모아 myaskpagedto로 반환 -성연 2021.01.07
	//public String checkid(String user);
	public List<Prod_Tbl> bestprods();
	public Seller_Tbl getseller(String s_id);
	public User_Tbl getuser(String u_id);
	
	public void updatebsns(String b_no, String b_name, HttpSession session); // -성연 2021.01.07
	
}
