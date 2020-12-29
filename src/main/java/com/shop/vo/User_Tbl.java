package com.shop.vo;

import lombok.Data;

@Data
public class User_Tbl {
	private String u_id, u_pw, name, phone, addr,addr2, cars, email;
	// hyejeong 2020.12.22 table name change
	// hyejeong 2020.12.29 table 칼럼 addr, addr2 추가

}
