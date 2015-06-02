package com.hanger.user.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.RelationVo;

public class RelationSearchDao {
	//
	private SqlMapClientTemplate smct;
	
	public RelationSearchDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<RelationVo> searchRelation(RelationVo relation){
		return (ArrayList<RelationVo>)smct.queryForList("selectRelation", relation);
	}
}
