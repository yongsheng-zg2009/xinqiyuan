package com.xqy.yongyou.entity;

import java.io.Serializable;

public class SysAdmin implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3544612618908526261L;
	
	private String userId;
	private String pwd;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}
