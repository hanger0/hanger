package com.hanger.mileage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.mileage.vo.MileageVo;

public class UserMileageDao {
	//
	private SqlMapClientTemplate smct;
	
	public UserMileageDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<MileageVo> selectUserMileage(HashMap<String, String> map){
		return (ArrayList<MileageVo>)smct.queryForList("selectUserMileage", map);
	}
	
	public MileageVo selectUseUserMileage(HashMap<String, String> map){
		return (MileageVo)smct.queryForObject("selectUseUserMileage", map);
	}

	public MileageVo selectReviewMileage(HashMap<String, String> map){
		return (MileageVo)smct.queryForObject("selectReviewMileage", map);
	}
}
