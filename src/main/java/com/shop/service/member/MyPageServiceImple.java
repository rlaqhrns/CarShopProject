package com.shop.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.shop.mapper.member.MyPageMapper;
import com.shop.vo.Criteria;
import com.shop.vo.MyAskPageDTO;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Seller_Tbl;
import com.shop.vo.User_Tbl;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyPageServiceImple implements MyPageService{
	
	private MyPageMapper mpmapper;

	@Override
	public MyAskPageDTO getAskList(Criteria crit, String s_id, String u_id) { //문의목록출력에 필요한 데이터를 모아 myaskpagedto로 반환 -성연 2021.01.07
		//셀러이면 자신이 등록한 상품에 대한 문의글이 보여지고
		//일반유저이면 본인이 작성한 문의글이 보여진다 -성연 2021.01.07
		return new MyAskPageDTO(mpmapper.getAskCnt(s_id, u_id), mpmapper.getAskWithPaging(crit, s_id, u_id));
	}

//	@Override
//	public String checkid(String user) {  세션의 user를 받아오면서 오늘 이후로 이 서비스&매퍼는 사용하지 않음 -성연 2021.01.07
//		// TODO Auto-generated method stub
//		return mpmapper.checkId(user);
//	}

	@Override
	public List<Prod_Tbl> bestprods() {
		// TODO Auto-generated method stub
		return mpmapper.getproducts();
	}

	@Override
	public Seller_Tbl getseller(String s_id) {
		// TODO Auto-generated method stub
		return mpmapper.getseller(s_id);
	}

	@Override
	public User_Tbl getuser(String u_id) {
		// TODO Auto-generated method stub
		return mpmapper.getuser(u_id);
	}

	@Override
	public void updatebsns(String b_no, String b_name, HttpSession session) {
		String s_id = (String)session.getAttribute("id");  //컨트롤러에서 파라미터로 보내진 세션에서 로그인 된 아이디 추출 -성연 2021.01.07
		
		mpmapper.updatebsns(b_no, b_name, s_id);
		
	}

}
