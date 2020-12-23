package com.shop.vo;

import lombok.Data;

@Data
public class Cart_Tbl {
	
	private String u_id,pname;
	private int pno,quantity,amount,total;
	// amount 총금액

	
	  @Override
	    public String toString() {
	        return "Cart_Tbl [u_id=" + u_id + ", pname=" + pname + ", pno=" + pno + ", quantity=" + quantity
	                + ", amount=" + amount  + "]";
	    }
	  
	  // 오버라이드 
	
}
