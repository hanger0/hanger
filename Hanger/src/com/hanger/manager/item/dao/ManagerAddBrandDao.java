package com.hanger.manager.item.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerBrandVo;

public class ManagerAddBrandDao {
	private SqlMapClientTemplate smct;

	public ManagerAddBrandDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	
	public void insertBrand(ManagerBrandVo brand)
	{
		smct.insert("insertBrand", brand);
	}
}
