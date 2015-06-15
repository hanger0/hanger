package com.hanger.posting.review.dao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.manager.item.vo.ManagerFeatureVo;
import com.hanger.posting.review.vo.ReviewVo;

public class ReviewWriteDao {
	private SqlMapClientTemplate smct;
	
	public ReviewWriteDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	public String insertReview(ReviewVo review){
		smct.insert("insertReview", review);
		return (String)smct.queryForObject("selectPostingCode");

	}
}
