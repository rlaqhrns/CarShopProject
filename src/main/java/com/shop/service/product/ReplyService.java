package com.shop.service.product;

import java.util.List;

import com.shop.vo.Reply_Tbl;

public interface ReplyService {
	
	public List<Reply_Tbl> replyList(int p_no);
	public void replyForm(Reply_Tbl reply);

}
