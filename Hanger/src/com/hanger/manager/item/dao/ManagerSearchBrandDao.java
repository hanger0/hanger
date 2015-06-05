package com.hanger.manager.item.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerBrandVo;

public class ManagerSearchBrandDao {
	private SqlMapClientTemplate smct;

	public ManagerSearchBrandDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public List<ManagerBrandVo> searchBrand(String inputBrand)
	{
		return (List<ManagerBrandVo>)smct.queryForList("brandList", inputBrand);
	}
	
	@SuppressWarnings("unchecked")
	public List<ManagerBrandVo> searchCompleteBrand(String inputBrand)
	{
		return (List<ManagerBrandVo>)smct.queryForList("searchCompleteBrand", inputBrand);
	}
	
}
