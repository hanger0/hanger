package com.hanger.posting.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewVo;

public class ReviewListDao {
	//
	private SqlMapClientTemplate smct ;
	
	public ReviewListDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ReviewVo> selectReview(String userCode) {
		return (ArrayList<ReviewVo>)smct.queryForList("selectReview", userCode);
	}
}
