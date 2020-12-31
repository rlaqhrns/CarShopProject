package com.shop.vo;

import lombok.Data;

@Data
public class Cart_Tbl {
	
	private String u_id,pname;
	private int p_no,quantity,amount,total;
	// amount 총금액

	
	
	  @Override
	    public String toString() {
	        return "Cart_Tbl [u_id=" + u_id + ", pname=" + pname + ", p_no=" + p_no + ", quantity=" + quantity
	                + ", amount=" + amount  + "]";
	    }
	  
	  // 오버라이드 
	
}

