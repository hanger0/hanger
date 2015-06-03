package com.hanger.manager.item.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.BrandVo;

public class ManagerAddBrandDao {
	private SqlMapClientTemplate smct;

	public ManagerAddBrandDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	
	public void insertBrand(BrandVo brand)
	{
		smct.insert("insertBrand", brand);
	}
}
