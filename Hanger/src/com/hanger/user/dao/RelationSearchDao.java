package com.hanger.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class RelationSearchDao {
	//
	private SqlMapClientTemplate smct;
	
	public RelationSearchDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> selectMyFollowerRelation(HashMap<String, String> map){
		return (ArrayList<UserVo>)smct.queryForList("selectFollowerRelation", map);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> selectMyFollowingRelation(HashMap<String, String> map){
		return (ArrayList<UserVo>)smct.queryForList("selectFollowingRelation", map);
	}
}
