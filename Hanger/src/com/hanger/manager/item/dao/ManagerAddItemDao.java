package com.hanger.manager.item.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.Item;

public class ManagerAddItemDao {
	private SqlMapClientTemplate smct;

	public ManagerAddItemDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public void insertHobby(Item item)
	{
		smct.insert("insertItem", item);
	}
}
