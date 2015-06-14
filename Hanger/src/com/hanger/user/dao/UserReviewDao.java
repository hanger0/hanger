package com.hanger.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewVo;

public class UserReviewDao {
	private SqlMapClientTemplate smct ;
		   
	public UserReviewDao(SqlMapClientTemplate smct) {
		this.smct = smct ;
	}
	   
	@SuppressWarnings("unchecked")
	public ArrayList<ReviewVo> selectUserReview(HashMap map) {
		return (ArrayList<ReviewVo>)smct.queryForList("selectUserReview", map);
	}
}
