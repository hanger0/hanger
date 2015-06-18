package com.hanger.posting.review.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewShowVo;
import com.hanger.posting.review.vo.ReviewVo;

public class ReviewShowDao {
	private SqlMapClientTemplate smct;

	public ReviewShowDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public List<ReviewVo> getReview(String reviewCode) {
		return (List<ReviewVo>) smct
				.queryForList("getReviewDetail", reviewCode);
	}

	@SuppressWarnings("unchecked")
	public List<ReviewShowVo> getReviewShow(HashMap map) {
		return (List<ReviewShowVo>) smct.queryForList("getReviewShow", map);
	}

	@SuppressWarnings("unchecked")
	public List<ReviewShowVo> getReviewNowShow(HashMap map) {
		return (List<ReviewShowVo>) smct.queryForList("getReviewNowShow", map);
	}

}
