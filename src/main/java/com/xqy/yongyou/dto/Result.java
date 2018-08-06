package com.xqy.yongyou.dto;

import java.io.Serializable;
import java.util.Map;

public class Result implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6912092396034244372L;

	private boolean success;
	
	private int errorType = 1;
	
	private String message;
	
	private Map<String, Object> data;
	
	public Object singleData;
	
	private Map<String,?> dataMap;
	
	private int count;
	
	public Result ()
	{
		this.success = Boolean.TRUE;
	}
	
	public Result (Boolean success)
	{
		this.success = success;
	}
	
	public boolean isSuccess() {
		return success;
	}
	
	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public int getErrorType() {
		return errorType;
	}
	
	public void setErrorType(int errorType) {
		this.errorType = errorType;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Map<String, Object> getData() {
		return data;
	}
	
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	
	public Object getSingleData() {
		return singleData;
	}
	
	public void setSingleData(Object singleData) {
		this.singleData = singleData;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Map<String, ?> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, ?> dataMap) {
		this.dataMap = dataMap;
	}
	
	
}
