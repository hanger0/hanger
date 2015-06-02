package com.hanger.user.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.RelationVo;

public class RelationInsertDao {
	//
	private SqlMapClientTemplate stmt;
	
	public RelationInsertDao(SqlMapClientTemplate stmt) {
		this.stmt = stmt;
	}
	
	public void insertRelation(RelationVo relation){
		stmt.insert("insertRelation", relation);
	}
}
