package com.shop.service.member;

import java.util.List;

import com.shop.vo.Black_Tbl;
import com.shop.vo.BlkPageDTO;
import com.shop.vo.Criteria;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Report_Tbl;

public interface BlackListService {
	//since decided using ajax for paging and listing, this service method is no longer neede -SungYeon 20.12.23
	//public List<Black_Tbl> getBlkList(Criteria crit); 
	
	public BlkPageDTO getBlkList(Criteria crit);
	
	public List<Black_Tbl> getBlack();
	
	public int blkremove(String s_id);
	
	public int getTotalCount();
	
	public boolean delete_allnseller(String s_id) throws Exception; //remove id from seller tbl & all user tbl at the same time -SungYeon 20.12.23
	
	public Prod_Tbl getprod(int p_no);
	
	public void insert_report(Report_Tbl report);
}
