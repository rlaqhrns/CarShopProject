package com.shop.vo;


import java.util.List;

import lombok.Data;

@Data

public class Prod_Tbl {
	private int p_no, c_no, amount, quantity, hit;

	private String s_id, p_name, discribe, compa, new_date, update_date,img1,img2,img3;
	private List<String> imgList;
	



	

}
