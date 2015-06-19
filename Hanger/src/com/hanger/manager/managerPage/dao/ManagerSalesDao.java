package com.hanger.manager.managerPage.dao;

import java.util.ArrayList;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.managerPage.vo.ManagerPeriodSalesVo;
import com.hanger.manager.managerPage.vo.ManagerSalesVo;

public class ManagerSalesDao {
	private SqlMapClientTemplate smct ;
	
	public ManagerSalesDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ManagerSalesVo> selectSalesList() {
		return (ArrayList<ManagerSalesVo>)smct.queryForList("managerSelectSalesListAll") ;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ManagerPeriodSalesVo> selectMonthSales(){
		return (ArrayList<ManagerPeriodSalesVo>)smct.queryForList("managerSelectMonthSales");
	}
}
