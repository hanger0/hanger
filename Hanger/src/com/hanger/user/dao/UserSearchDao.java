package com.hanger.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.user.vo.UserVo;

public class UserSearchDao {
	//
	private SqlMapClientTemplate smct;

	public UserSearchDao(SqlMapClientTemplate smct) {
		this.smct = smct;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<UserVo> searchUser(HashMap<String, String> map) {
		return (ArrayList<UserVo>) smct.queryForList("searchUser", map);
	}

	// 팔로우 된 친구만 검색
	public ArrayList<UserVo> mainFriendSearch(HashMap map) {
		return (ArrayList<UserVo>) smct.queryForList("selectFriend", map);

	}

	// 팔로우 된 친구 검색 중 검색어가 공백 일때 모든친구 검색
	public ArrayList<UserVo> mainFriendAllSearch(HashMap map) {

		return (ArrayList<UserVo>) smct.queryForList("selectAllFriend", map);
	}

}
