package com.hanger.posting.review.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.posting.review.vo.ReviewLikeCheckVo;

public class ReviewLikeCheckDao {

	private SqlMapClientTemplate smct;
	
	public ReviewLikeCheckDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	//그사람이 좋아요를 눌렀는지 안눌렀는지 select문
	public ArrayList<ReviewLikeCheckVo> selectLike(HashMap map){
		return (ArrayList<ReviewLikeCheckVo>)smct.queryForList("selectReviewLike", map);
	}
	
	//좋아요 총 count 수 구하는 select문
	/*
	public ArrayList<ReviewLikeCheckVo> selectLikeCount(HashMap map){
		return (ArrayList<ReviewLikeCheckVo>)smct.queryForList("selectLikeCount", map);
	}
	*/
	public ArrayList<ReviewLikeCheckVo> insertLike(HashMap map){
		return (ArrayList<ReviewLikeCheckVo>)smct.insert("insertReviewLike", map);
	}
	
	public int deleteLike(HashMap map){
		return smct.update("deleteReviewLike", map);
	}
}
