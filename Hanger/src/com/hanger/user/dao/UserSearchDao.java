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

	// �ȷο� �� ģ���� �˻�
	public ArrayList<UserVo> mainFriendSearch(HashMap map) {
		return (ArrayList<UserVo>) smct.queryForList("selectFriend", map);

	}

	// �ȷο� �� ģ�� �˻� �� �˻�� ���� �϶� ���ģ�� �˻�
	public ArrayList<UserVo> mainFriendAllSearch(HashMap map) {

		return (ArrayList<UserVo>) smct.queryForList("selectAllFriend", map);
	}

}
