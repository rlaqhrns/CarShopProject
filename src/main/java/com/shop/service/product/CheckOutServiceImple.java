package com.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CheckOutMapper;
import com.shop.vo.Cart_Tbl;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;

@Service
public class CheckOutServiceImple implements CheckOutService{
	@Setter(onMethod_ =@Autowired)
	private CheckOutMapper mapper;

	@Override
	public List<User_Tbl> userList() {
		//user_tbl에서 유저의 정보를 가져옴 (재원/20.12.23)
		System.out.println(mapper.userList().get(0).getName());
		return mapper.userList();
	}

	@Override
	public User_Tbl getUser(String u_id) {
		// TODO Auto-generated method stub
		return mapper.getUser(u_id);
	}

	@Override
	public List<Cart_Tbl> cartList(String u_id) {
		// TODO Auto-generated method stub
		return mapper.cartList(u_id);
	}

	@Override
	public void deleteCartList(String u_id) {
		// TODO Auto-generated method stub
		mapper.deleteCartList(u_id);
		
	}

	@Override
	public void insertBuyList(Order_Histroy_Tbl order) {
		// TODO Auto-generated method stub
		
		String u_id = "something";	//임시 아이디 설정 (재원/20.12.28)
		List<Cart_Tbl> cartL = mapper.cartList(u_id); //카트 정보 list로 받아오기 (재원/20.12.28)
		
		for(int i =0; i<cartL.size(); i++) { //들어가는지 확인 (재원/20.12.28)
			System.out.println(cartL.get(i).getAmount());
		}
		
		for(int i =0; i<cartL.size(); i++) { //카트 정보를 담은 List 돌면서 mapping 함 (재원/20.12.28)
			order.setU_id(cartL.get(i).getU_id());		
			order.setAmount(cartL.get(i).getAmount());
			order.setPname(cartL.get(i).getPname());
			order.setQuantity(cartL.get(i).getQuantity());
			order.setP_no(cartL.get(i).getP_no()); //vo 객체를 바꾸면서 수정 setPno, getPno(재원/20.12.29)
			mapper.insertBuyList(order);
		}

		
	}
	
	
}
