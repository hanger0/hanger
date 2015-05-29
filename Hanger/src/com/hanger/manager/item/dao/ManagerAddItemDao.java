package com.hanger.manager.item.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ItemVo;

public class ManagerAddItemDao {
	private SqlMapClientTemplate smct;

	public ManagerAddItemDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public void insertItem(ItemVo item)
	{
		smct.insert("insertItem", item);
	}
}
