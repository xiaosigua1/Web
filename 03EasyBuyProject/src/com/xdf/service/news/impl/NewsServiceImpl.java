package com.xdf.service.news.impl;

import com.xdf.bean.Easybuy_News;
import com.xdf.dao.news.NewsDao;
import com.xdf.dao.news.impl.NewsDaoImpl;
import com.xdf.service.news.NewsService;

public class NewsServiceImpl implements NewsService {

	private NewsDao dao = new NewsDaoImpl();

	/**
	 * 新增
	 */
	@Override
	public int add(Easybuy_News t) {
		return dao.add(t);
	}

}
