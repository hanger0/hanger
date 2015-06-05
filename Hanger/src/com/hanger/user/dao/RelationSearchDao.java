package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class RelationSearchDao {
	//
	private SqlMapClientTemplate smct;
	
	public RelationSearchDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> searchFollowerRelation(String myUserCode){
		return (ArrayList<UserVo>)smct.queryForList("selectFollowerRelation", myUserCode);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> searchFollowingRelation(String myUserCode){
		return (ArrayList<UserVo>)smct.queryForList("selectFollowingRelation", myUserCode);
	}
}
