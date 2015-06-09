package com.hanger.item.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.item.vo.ItemViewVo;

public class ItemViewDao {
	private SqlMapClientTemplate smct;

	public ItemViewDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ItemViewVo> getItemView(HashMap<String, String> itemViewMap) {
		return (ArrayList<ItemViewVo>) smct.queryForList("getItemView", itemViewMap);
	}
}
