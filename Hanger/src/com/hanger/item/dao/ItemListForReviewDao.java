package com.hanger.item.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.item.vo.ItemListForReviewVo;

public class ItemListForReviewDao {
	private SqlMapClientTemplate smct;

	public ItemListForReviewDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ItemListForReviewVo> getItemListForReview(String userCode) {
		return (ArrayList<ItemListForReviewVo>) smct.queryForList("getItemListForReview", userCode);
	}
}
