package com.xdf.dao;

import java.sql.SQLException;
import java.util.List;

import com.xdf.bean.Easybuy_News;
import com.xdf.util.BaseDao;
import com.xdf.util.PageUtil;
import com.xdf.util.ResultSetUtil;

public class NewsDaoImpl extends BaseDao implements NewsDao {

	@Override
	public int getCounts() {
		String sql = "select  count(*) from  easybuy_news";
		rs = executeQuery(sql);
		int num = 0;
		try {
			if (rs.next()) {
				num = rs.getInt(1);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public List<Easybuy_News> findAllNewsByPage(PageUtil util) {
		String sql = "select * from easybuy_news limit ?,?";
		Object[] params = { (util.getPageIndex() - 1) * util.getPageSize(),
				util.getPageSize() };
		rs = executeQuery(sql, params);
		return ResultSetUtil.eachResultSet(rs, Easybuy_News.class);
	}

}
