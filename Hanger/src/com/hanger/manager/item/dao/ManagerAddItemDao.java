package com.hanger.manager.item.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientOperations;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerCategoryVo;
import com.hanger.manager.item.vo.ManagerFeatureVo;
import com.hanger.manager.item.vo.ManagerItemVo;

public class ManagerAddItemDao {
	private SqlMapClientTemplate smct;

	public ManagerAddItemDao(SqlMapClientTemplate smct)
	{
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public List<ManagerCategoryVo> selectCategory1(){
		return (List<ManagerCategoryVo>)smct.queryForList("selectCategory1");
	}

	@SuppressWarnings("unchecked")
	public List<ManagerCategoryVo> selectCategory2(){
		return (List<ManagerCategoryVo>)smct.queryForList("selectCategory2");
	}
	
	@SuppressWarnings("unchecked")
	public List<ManagerCategoryVo> selectCategory3(){
		return (List<ManagerCategoryVo>)smct.queryForList("selectCategory3");
	}
	
	@SuppressWarnings("unchecked")
	public List<ManagerFeatureVo> selectFeature1(){
		return (List<ManagerFeatureVo>)smct.queryForList("selectFeature1");
	}
	
	@SuppressWarnings("unchecked")
	public List<ManagerFeatureVo> selectFeature2(){
		return (List<ManagerFeatureVo>)smct.queryForList("selectFeature2");
	}
	
	public void insertItem(ManagerItemVo item)
	{
		smct.insert("insertItem", item);
	}
	
	public void insertItemStock(ManagerItemVo item){
		smct.insert("insertItemStock", item);
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
