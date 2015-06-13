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
	//�׻���� ���ƿ並 �������� �ȴ������� select��
	public ArrayList<ReviewLikeCheckVo> selectLike(HashMap map){
		return (ArrayList<ReviewLikeCheckVo>)smct.queryForList("selectReviewLike", map);
	}
	
	//���ƿ� �� count �� ���ϴ� select��
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
