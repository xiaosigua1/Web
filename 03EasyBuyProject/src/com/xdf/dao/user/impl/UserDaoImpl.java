package com.xdf.dao.user.impl;

import java.io.Serializable;
import java.util.List;

import com.xdf.bean.Easybuy_User;
import com.xdf.dao.user.UserDao;
import com.xdf.util.BaseDao;
import com.xdf.util.ResultSetUtil;

public class UserDaoImpl extends BaseDao implements UserDao {

	/**
	 * 注册新用户
	 */
	@Override
	public int add(Easybuy_User user) {
		String sql = "INSERT INTO easybuy_user(loginName,userName,`password`,sex,identityCode,email,mobile) "
				+ "VALUES(?,?,?,?,?,?,?)";
		Object[] params = { user.getLoginName(), user.getUserName(),
				user.getPassword(), user.getSex(), user.getIdentityCode(),
				user.getEmail(), user.getMobile() };
		return executeUpdate(sql, params);
	}

	/**
	 * 登录
	 */
	@Override
	public Easybuy_User login(String userName, String password) {
		String sql = "select * from easybuy_user where loginName=? and password=?";
		Object[] params = { userName, password };
		rs = executeQuery(sql, params);
		Easybuy_User user = ResultSetUtil.findOne(rs, Easybuy_User.class);
		return user;
	}

	/**
	 * 删除
	 */
	@Override
	public int delete(Serializable id) {
		String sql = "delete from easybuy_user where id=? ";
		Object[] params = { id };
		return executeUpdate(sql, params);
	}

	/**
	 * 修改用户
	 */
	@Override
	public int update(Easybuy_User t) {
		String sql = "update  easybuy_user  set  loginName=?,userName=?,email=?,sex=?,mobile=? where id=? ";
		Object[] params = { t.getLoginName(), t.getUserName(), t.getEmail(),
				t.getSex(), t.getMobile(), t.getId() };
		return executeUpdate(sql, params);
	}

	/**
	 * 查询所有的用户信息
	 */
	@Override
	public List<Easybuy_User> findAll(Object... objects) {
		String sql = "select * from  easybuy_user";
		rs = executeQuery(sql);
		List<Easybuy_User> list = ResultSetUtil.eachResultSet(rs,
				Easybuy_User.class);
		closeConnection();
		return list;
	}

	@Override
	public Easybuy_User findOne(Object... id) {
		String sql = "select * from  easybuy_user where id=?";
		rs = executeQuery(sql, id);
		return ResultSetUtil.findOne(rs, Easybuy_User.class);
	}

}
