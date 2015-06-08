package com.hanger.manager.item.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientOperations;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerItemVo;
import com.hanger.user.vo.UserVo;

public class ManagerAddItemDao {
	private SqlMapClientTemplate smct;

	public ManagerAddItemDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	public void insertItem(ManagerItemVo item)
	{
		smct.insert("insertItem", item);
	}
	
	public void insertItemCategory(String category){
		smct.insert("insertItemCategory", category);
	}
	
	public void insertItemFeature(String feature){
		smct.insert("insertItemFeature", feature);
	}
	
	public void insertItemPic(ManagerItemVo item)
	{
		((SqlMapClientOperations) smct).queryForList("addItemPicCode");
		smct.insert("insertItemPic", item);
	}
}
