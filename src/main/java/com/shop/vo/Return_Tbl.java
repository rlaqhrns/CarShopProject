package com.shop.vo;

import lombok.Data;

@Data
public class Return_Tbl {
	private int ono;
	private String u_id, pname, content, date, s_id;
	
	private Order_Histroy_Tbl order;

}
