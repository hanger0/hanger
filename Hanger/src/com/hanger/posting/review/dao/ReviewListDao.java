package com.hanger.posting.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewListVo;

public class ReviewListDao {
	//
	private SqlMapClientTemplate smct ;
	
	public ReviewListDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ReviewListVo> selectReview() {
		return (ArrayList<ReviewListVo>)smct.queryForList("selectReview");
	}
}
