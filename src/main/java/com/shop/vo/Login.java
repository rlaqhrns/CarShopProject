package com.shop.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Login {

	private String id;
	private String pw;
	private String email;
	private String pw1;
	private String pw2;

}
