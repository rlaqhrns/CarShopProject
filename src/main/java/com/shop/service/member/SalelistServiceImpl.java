package com.shop.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.member.SalelistMapper;
import com.shop.vo.Prod_Tbl;

import lombok.Setter;

@Service
public class SalelistServiceImpl implements SalelistService {

	@Setter(onMethod_=@Autowired)
	protected SalelistMapper smapper;
	
	
	@Override
	public List<Prod_Tbl> selectall(String s_id) {
		return smapper.selectall(s_id);
	}

}
