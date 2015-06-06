package com.hanger.item.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ItemSearchInfoDao {
	private SqlMapClientTemplate smct;

	public ItemSearchInfoDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public ArrayList getItemSearchInfoList(HashMap<String, String> map) {
		return (ArrayList) smct.queryForList("getItemSearchInfo", map);
	}
}
