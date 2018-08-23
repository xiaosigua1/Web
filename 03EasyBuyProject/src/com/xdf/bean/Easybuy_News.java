package com.xdf.bean;

import java.util.Date;

/**
 *  新闻的实体类
 * 失去一日甚易,欲得回已无途！
 *  
 * @author 小葱拌豆腐
 * 2017-11-23上午8:44:57
 */
public class Easybuy_News {

	private Integer id; // 新闻的编号
	private String title; // 新闻的标题
	private String content; // 新闻的内容
	private Date createTime; // 新闻的创建时间
	private String img; // 新闻的图片

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Easybuy_News(Integer id, String title, String content,
			Date createTime, String img) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.img = img;
	}

	public Easybuy_News() {
		super();
	}

	@Override
	public String toString() {
		return "Easybuy_News [id=" + id + ", title=" + title + ", content="
				+ content + ", createTime=" + createTime + ", img=" + img + "]";
	}

}
