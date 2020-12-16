package com.shop.vo;

import lombok.Data;

@Data
public class Reply_Tbl {
	private String u_id, r_title, r_content, r_date, img, reply, s_id, ru_date;
	private int rate, p_no;

}
