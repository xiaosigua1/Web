package com.xdf.dao;

import java.util.List;

import com.xdf.bean.Easybuy_News;
import com.xdf.util.PageUtil;

public interface NewsDao {

	/**
	 * 查询总记录数
	 */
	int getCounts();

	/**
	 * PageUtil  分页的工具类
	 */
	List<Easybuy_News> findAllNewsByPage(PageUtil util);

}
