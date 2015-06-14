package com.hanger.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.reply.vo.ReplyVo;

public class ReplyUpdateDao {
	
	private SqlMapClientTemplate smct;
	
	public ReplyUpdateDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ReplyVo> updateReply(HashMap map){
		return (ArrayList<ReplyVo>)smct.queryForList("updateReply", map);
	}
}
