package com.hanger.manager.managerPage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.managerPage.vo.ManagerOrderListVo;

public class ManagerOrderListDao {
	private SqlMapClientTemplate smct ;
	
	public ManagerOrderListDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	
	public ArrayList<ManagerOrderListVo> selectAllOrderListAll(HashMap map) {
		return (ArrayList<ManagerOrderListVo>)smct.queryForList("managerSelectAllOrderListAll", map) ;
	}
}
