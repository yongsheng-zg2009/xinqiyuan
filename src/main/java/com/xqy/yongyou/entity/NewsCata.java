package com.xqy.yongyou.entity;

import java.io.Serializable;

public class NewsCata implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 85278483189393849L;
	private int id; // 自增id
	private String title;//分类名称
	private String rootId;//分类编号
	private int number;// 分类下文章数据量
	private String remark;// 备注
	private String createTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRootId() {
		return rootId;
	}
	public void setRootId(String rootId) {
		this.rootId = rootId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}

	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
