package com.hanger.manager.item.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.BrandVo;

public class ManagerSearchBrandDao {
	private SqlMapClientTemplate smct;

	public ManagerSearchBrandDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public List<BrandVo> searchBrand(String inputBrand)
	{
		return (List<BrandVo>)smct.queryForList("brandList", inputBrand);
	}
	
	@SuppressWarnings("unchecked")
	public List<BrandVo> searchCompleteBrand(String inputBrand)
	{
		return (List<BrandVo>)smct.queryForList("searchCompleteBrand", inputBrand);
	}
	
}
