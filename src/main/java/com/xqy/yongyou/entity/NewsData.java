package com.xqy.yongyou.entity;

import java.io.Serializable;

import com.xqy.yongyou.util.DateUtil;

/**
 * 新闻数据
 * @author niyongsheng
 *
 */
public class NewsData implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 85278483189393849L;
	private int id; // 自增id
	private String cataId;//分类编号
	private String title;//分类名称
	private String content;//分类名称
	private String picture;//分类名称
	private String saveFileName;//分类名称
	private String savePathFileName;//分类名称
	private String createTime;//分类名称
	private String num;//分类名称
	private String hits;//分类名称
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCataId() {
		return cataId;
	}
	public void setCataId(String cataId) {
		this.cataId = cataId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getSavePathFileName() {
		return savePathFileName;
	}
	public void setSavePathFileName(String savePathFileName) {
		this.savePathFileName = savePathFileName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public String getCreateTimeMMDD(){
		return DateUtil.formatDate(DateUtil.parseDate(createTime, DateUtil.PATTERN_YY_MM_DD_HHMMSS), DateUtil.PATTERN_MM_DD);
	}
	
	
	public String getCreateTimeYYYYMMDD(){
		return DateUtil.formatDate(DateUtil.parseDate(createTime, DateUtil.PATTERN_YY_MM_DD_HHMMSS), DateUtil.PATTERN_YY_MM_DD);
	}
	
	
}
