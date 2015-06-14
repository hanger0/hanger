package com.hanger.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.reply.vo.ReplyVo;

public class ReplyRemoveDao {

	private SqlMapClientTemplate smct;
	
	public ReplyRemoveDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ReplyVo> removeReply(HashMap map){
		return (ArrayList<ReplyVo>)smct.queryForList("removeReply", map);
	}
}
