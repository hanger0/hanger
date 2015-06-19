package com.hanger.manager.managerPage.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.managerPage.vo.ManagerStockVo;

public class ManagerStockDao {
	private SqlMapClientTemplate smct;

	public ManagerStockDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ManagerStockVo> selecStockAll(){
		return (ArrayList<ManagerStockVo>) smct.queryForList("managerSelecStockAll");
	}
	
}
