package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.AskPrintVO;
import com.shop.vo.Criteria;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

public interface MyPageMapper {
	public int getAskCnt(String s_id, String u_id);
	public List<AskPrintVO> getAskWithPaging(Criteria crit, String s_id, String u_id);
	public String checkId(String user);
	public List<Prod_Tbl> getproducts();
	public Seller_Tbl getseller(String s_id);
	public User_Tbl getuser(String u_id);

}
