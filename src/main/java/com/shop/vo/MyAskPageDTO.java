package com.shop.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyAskPageDTO {
	private int askCnt;
	private List<AskPrintVO> askList;	
}
