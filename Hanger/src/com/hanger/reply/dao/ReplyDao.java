package com.hanger.reply.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.reply.vo.ReplyVo;

public class ReplyDao {
	private SqlMapClientTemplate smct ;
	
	public ReplyDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	public ArrayList<String> selectSeq() {
		return (ArrayList<String>)smct.queryForList("selectReplySeq") ;
	}
	public void insertReply(HashMap map) {
		smct.insert("insertReply", map);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ReplyVo> selectReply(HashMap map) {
		return (ArrayList<ReplyVo>)smct.queryForList("selectReply",map) ;
	}
	
	public void updateReply(HashMap map) {
		smct.delete("updateReply", map);
	}
	
	public void deleteReply(HashMap map) {
		smct.delete("deleteReply", map);
	}
}
