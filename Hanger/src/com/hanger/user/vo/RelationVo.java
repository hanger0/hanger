package com.hanger.user.vo;

public class RelationVo {
	private String relationFollower;
	private String relationFollowing;
	private String regId;
	private String regDate;
	private String regIp;
	private String updId;
	private String updDate;
	private String updIp;
	
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}
	public String getUpdId() {
		return updId;
	}
	public void setUpdId(String updId) {
		this.updId = updId;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getUpdIp() {
		return updIp;
	}
	public void setUpdIp(String updIp) {
		this.updIp = updIp;
	}

	public String getRelationFollower() {
		return relationFollower;
	}
	public void setRelationFollower(String relationFollower) {
		this.relationFollower = relationFollower;
	}
	public String getRelationFollowing() {
		return relationFollowing;
	}
	public void setRelationFollowing(String relationFollowing) {
		this.relationFollowing = relationFollowing;
	}
}
