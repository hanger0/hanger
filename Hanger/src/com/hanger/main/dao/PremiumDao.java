package com.hanger.main.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class PremiumDao {

	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public PremiumDao() {
	}


	public ArrayList getPremiumList() {
		return (ArrayList) smct.queryForList("getPremiumList");
	}

}
