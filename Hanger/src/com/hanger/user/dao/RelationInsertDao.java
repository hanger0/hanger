package com.hanger.user.dao;

import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class RelationInsertDao {
	//
	private SqlMapClientTemplate stmt;
	
	public RelationInsertDao(SqlMapClientTemplate stmt) {
		this.stmt = stmt;
	}
	
	public void insertRelation(HashMap map){
		stmt.insert("insertRelation", map);
	}
}
