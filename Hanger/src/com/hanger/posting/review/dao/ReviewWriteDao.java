package com.hanger.posting.review.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerFeatureVo;
import com.hanger.posting.review.vo.ReviewVo;
import com.hanger.user.vo.UserVo;

public class ReviewWriteDao {
	private SqlMapClientTemplate smct;

	public ReviewWriteDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	public Object insertReview(ReviewVo review) {
		return smct.insert("insertReview", review);
	}
	
	public String selectPostingCode(HashMap map) {
		return (String) smct.queryForObject("selectPostingCode", map);
	}

	@SuppressWarnings("unchecked")
	public Double selectReviewScoreAvg(String itemGroupCode){
		return (Double)smct.queryForObject("selectReviewScoreAvg", itemGroupCode);
	}
	
	public void updateItemScore(HashMap scoreMap){
		smct.update("updateItemScore", scoreMap);
	}
		
}
