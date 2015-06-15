package com.hanger.item.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ItemListForReviewDao {
	private SqlMapClientTemplate smct;

	public ItemListForReviewDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	public ArrayList getItemListForReview(String userCode) {
		
		return (ArrayList) smct.queryForList("getItemListForReview", userCode);
	}
}
