package com.xdf.dao.news.impl;

import java.io.Serializable;
import java.util.List;

import com.xdf.bean.Easybuy_News;
import com.xdf.dao.news.NewsDao;
import com.xdf.util.BaseDao;

public class NewsDaoImpl extends BaseDao implements NewsDao {

	/**
	 * 新闻的新增 带有文件上传
	 */
	@Override
	public int add(Easybuy_News t) {
		String sql = "insert into  easybuy_news(title,content,createTime,img) values(?,?,?,?)";
		Object[] params = { t.getTitle(), t.getContent(), t.getCreateTime(),
				t.getImg() };
		int num = executeUpdate(sql, params);
		return num;
	}

	@Override
	public int delete(Serializable s) {
		return 0;
	}

	@Override
	public int update(Easybuy_News t) {
		return 0;
	}

	@Override
	public List<Easybuy_News> findAll(Object... objects) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Easybuy_News findOne(Object... objects) {
		// TODO Auto-generated method stub
		return null;
	}

}
