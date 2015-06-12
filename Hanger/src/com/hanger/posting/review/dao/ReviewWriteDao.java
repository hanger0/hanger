package com.hanger.posting.review.dao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewVo;

public class ReviewWriteDao {
	private SqlMapClientTemplate smct;
	
	public ReviewWriteDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public void insertReview(ReviewVo review){
		smct.insert("insertReview", review);
	}
}
