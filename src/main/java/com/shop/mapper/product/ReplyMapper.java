package com.shop.mapper.product;

import java.util.List;

import com.shop.vo.Reply_Tbl;

public interface ReplyMapper {
	
	public List<Reply_Tbl> replyList(int p_no);
	public void replyForm(Reply_Tbl reply);

}
