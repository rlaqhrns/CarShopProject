package com.shop.service.member;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.mapper.member.BlackListMapper;
import com.shop.mapper.product.ProductBuyMapper;
import com.shop.vo.Black_Tbl;
import com.shop.vo.BlkPageDTO;
import com.shop.vo.Criteria;
import com.shop.vo.Prod_Tbl;
import com.shop.vo.Report_Tbl;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BlackListServiceImple implements BlackListService{
	
	private BlackListMapper mapper;
	private ProductBuyMapper prodmapper;

//	@Override  since i decided to work using ajax, this service method is no longer needed -SungYeon 20.12.23
//	public List<Black_Tbl> getBlkList(Criteria crit) {
//		// TODO Auto-generated method stub
//		System.out.println("블랙리스트 서비스 목록 가져오기");
//		return mapper.getBlackWithPaging(crit);
//	}

	@Override  //get black list data -SungYeon 20.12.23
	public List<Black_Tbl> getBlack() {
		// TODO Auto-generated method stub
		return mapper.getBlack();
	}

	@Override  //remove id from black tbl -SungYeon 20.12.23
	public int blkremove(String s_id) {
		// TODO Auto-generated method stub
		return mapper.delete(s_id);
	}

	@Override  //get total count of black tbl data -SungYeon 20.12.23
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

	@Override //get total cnt and data for ajax listing of black list -SungYeon 20.12.23
	public BlkPageDTO getBlkList(Criteria crit) {
		// TODO Auto-generated method stub
		return new BlkPageDTO(mapper.getTotal(), mapper.getBlackWithPaging(crit));
	}

	@Transactional  //two mapper methods must work successfully at the same time -SungYeon 20.12.23
	@Override
	public boolean delete_allnseller(String s_id) {
		// TODO Auto-generated method stub
		try {   //try-catch to process the exception during transaction -SungYeon 20.12.23
			int a = mapper.delete_alluser(s_id);
			int b = mapper.delete_seller(s_id);
			
			return a == 1 && b == 1;
			
		} catch (Exception e) {
			System.out.println("블랙리스트페이지 트랜잭션 실패");
			return false;
		}

	}

	@Override
	public Prod_Tbl getprod(int p_no) {
		// TODO Auto-generated method stub
		return prodmapper.getProduct(p_no);
	}

	@Override
	public void insert_report(Report_Tbl report) {
		mapper.insert_report(report);
		
	}

}
