package com.shop.vo;

import lombok.Data;

@Data
public class Order_Histroy_Tbl {
	private String u_id, pay, order_date;
	private int p_no, quantity, amount;

}
