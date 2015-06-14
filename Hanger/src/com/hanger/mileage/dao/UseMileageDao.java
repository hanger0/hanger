package com.hanger.mileage.dao;

import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class UseMileageDao {
	//
	private SqlMapClientTemplate smct;
	
	public UseMileageDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public void insertUseMileage(HashMap<String, String> map){
		smct.insert("insertUseMileage", map);
	}
}
