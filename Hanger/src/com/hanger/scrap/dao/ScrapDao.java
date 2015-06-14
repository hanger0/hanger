package com.hanger.scrap.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.scrap.vo.ScrapVo;

public class ScrapDao {
	private SqlMapClientTemplate smct ;
	
	public ScrapDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	public void insertScrap(HashMap map) {
		smct.insert("insertScrap", map);
	}
	//½ºÅ©·¦ AJAX
	public ArrayList<ScrapVo> selectScrap(HashMap map) {
		return (ArrayList<ScrapVo>)smct.queryForList("selectScrap",map) ;
	}
	public void deleteScrap(HashMap map) {
		smct.delete("deleteScrap", map);
	}
}
