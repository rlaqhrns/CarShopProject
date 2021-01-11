package com.shop.mapper.member;

import java.util.List;

import com.shop.vo.Black_Tbl;
import com.shop.vo.Criteria;
import com.shop.vo.Report_Tbl;

public interface BlackListMapper {
	
	public List<Black_Tbl> getBlack();
	
	public List<Black_Tbl> getBlackWithPaging(Criteria crit); //get data for paging format -SungYeon 20.12.23
	
	public int delete(String s_id); //remove certain id from black tbl -SungYeon 20.12.23
	
	public int getTotal(); //get count of black list data -SungYeon 20.12.23
	
	public int delete_alluser(String s_id);  //remove id from all user tbl -SungYeon 20.12.23
	
	public int delete_seller(String s_id);  //remove id from seller tbl -SungYeon 20.12.23
	
	public void insert_report(Report_Tbl report);

}
