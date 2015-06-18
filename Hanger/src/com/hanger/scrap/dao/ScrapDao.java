package com.hanger.scrap.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.scrap.vo.ScrapVo;

public class ScrapDao {
	private SqlMapClientTemplate smct ;
	
	public ScrapDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	public List<ScrapVo> selectScrapYn(HashMap<String, String> map) {
		return (ArrayList<ScrapVo>)smct.queryForList("selectScrapYn",map) ;
	}
	public void insertScrap(HashMap<String, String> map) {
		smct.insert("insertScrap", map);
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<ScrapVo> selectScrap(HashMap<String, String> map) {
		return (ArrayList<ScrapVo>)smct.queryForList("selectScrap",map) ;
	}
	public void deleteScrap(HashMap<String, String> map) {
		smct.delete("deleteScrap", map);
	}
}
