package com.hanger.main.vo;

public class StoreListCondition {
	
	String keyWord;
	String keyType;
	String no;
	String category;
	
	
	public StoreListCondition(String keyWord, String keyType, String no, String category) {
		this.keyWord = keyWord;
		this.keyType = keyType;
		this.no = no;
		this.category = category;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKeyType() {
		return keyType;
	}
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}

}
