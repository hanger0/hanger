package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.RelationVo;

public class RelationDeleteDao {
	//
	private SqlMapClientTemplate smct;

	public RelationDeleteDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public int deleteRelation(RelationVo relation){
		return smct.delete("deleteRelation", relation);
	}
}
