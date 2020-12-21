package com.shop.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10); //기본생성자
	}
	
	public Criteria(int pageNum, int amount) {  //생성할때 숫자 수정할 수 있음
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
