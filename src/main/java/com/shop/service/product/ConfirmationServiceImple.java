package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.ConfirmationMapper;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Return_Tbl;

import lombok.Setter;

@Service
public class ConfirmationServiceImple implements ConfirmationService{

	@Setter(onMethod_ = @Autowired)
	private ConfirmationMapper mapper;
	
	@Override
	public List<Order_Histroy_Tbl> orderList(String u_id) {
		// TODO Auto-generated method stub
		return mapper.orderList(u_id); //전체 구입물품 조회 (재원/20.12.30)
	}

	@Override
	public List<Order_Histroy_Tbl> orderListDate(String u_id, String order_date) {
		// TODO Auto-generated method stub
		return mapper.orderDateLists(u_id, order_date);
	}

	@Override
	public Order_Histroy_Tbl getReturn(int ono) {
		// TODO Auto-generated method stub
		return mapper.getReturn(ono);
	}

	@Override
	public Prod_Tbl findSid(int p_no) {
		// TODO Auto-generated method stub
		 
		return mapper.findSid(p_no);
	}

	@Override
	public void insertForms(Return_Tbl returntbl) {
		// TODO Auto-generated method stub
		mapper.insertForms(returntbl);
	}

	@Override
	public List<Prod_Tbl> findList(int p_no) {
		// TODO Auto-generated method stub
		return mapper.findList(p_no);
	}

	@Override
	public List<Order_Histroy_Tbl> formList(String u_id) {
		// TODO Auto-generated method stub
		return mapper.formList(u_id);
	}

	@Override
	public List<Order_Histroy_Tbl> orderEventLists(String u_id, String order_date, int ono) {
		// TODO Auto-generated method stub
		return mapper.orderEventLists(u_id, order_date, ono);
	}

	@Override
	public boolean returnOne(int ono) {
		// TODO Auto-generated method stub
		
		boolean hasData = true;
		
		Return_Tbl returntbl = mapper.returnOne(ono);
		if(returntbl == null) {
			hasData = true;
		}
		else {
			hasData = false;
		}
		
		return hasData;
	}


}
