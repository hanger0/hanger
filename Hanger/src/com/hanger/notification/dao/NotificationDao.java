package com.hanger.notification.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.hanger.notification.vo.NotificationVo;

public class NotificationDao {
	//
	private SqlMapClientTemplate smct;
	
	public NotificationDao(SqlMapClientTemplate smct){
		this.smct = smct;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<NotificationVo> selectNotification(String myUserCode){
		return (ArrayList<NotificationVo>)smct.queryForList("selectNotification", myUserCode);
	}
	
	public void insertNotification(HashMap<String, String> map){
		smct.insert("insertNotification", map);
	}
	
	public void updateNotificationReadYn(HashMap<String, String> map){
		smct.update("updateNotificationReadYn", map);
	}
	
	public void deleteNotification(HashMap<String, String> map){
		smct.delete("deleteNotification", map);
	}
}
