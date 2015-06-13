package com.hanger.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.reply.vo.ReplyVo;


public class ReplySelectDao {
	
	private SqlMapClientTemplate smct;
	
	public ReplySelectDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ReplyVo> selectReply(HashMap map){
		return (ArrayList<ReplyVo>)smct.queryForList("selectReply", map);
	}
}
