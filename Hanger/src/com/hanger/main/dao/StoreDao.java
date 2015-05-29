package com.hanger.main.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.main.vo.StoreListCondition;

public class StoreDao {
	private SqlMapClientTemplate smct;

	public void setSmct(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public StoreDao() {
	}

	public ArrayList getStoreList(StoreListCondition storeListCondition) {
		return (ArrayList) smct.queryForList("getStoreList", storeListCondition);
	}
}
