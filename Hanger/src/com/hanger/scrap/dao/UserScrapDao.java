package com.hanger.scrap.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.scrap.vo.UserScrapVo;

public class UserScrapDao {
	private SqlMapClientTemplate smct ;
	
	public UserScrapDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<UserScrapVo> selectUserScrap(HashMap map) {
		return (ArrayList<UserScrapVo>)smct.queryForList("selectUserScrap", map) ;
	}
}
