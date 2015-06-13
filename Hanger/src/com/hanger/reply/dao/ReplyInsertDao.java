package com.hanger.reply.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.reply.vo.ReplyVo;


public class ReplyInsertDao {
	
	private SqlMapClientTemplate smct;
	
	public ReplyInsertDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public void insertReply(ReplyVo reply)
	{
		smct.insert("insertReply", reply);
	}
}
