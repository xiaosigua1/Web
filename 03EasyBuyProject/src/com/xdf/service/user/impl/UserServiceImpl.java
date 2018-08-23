package com.xdf.service.user.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.xdf.bean.Easybuy_User;
import com.xdf.dao.user.UserDao;
import com.xdf.dao.user.impl.UserDaoImpl;
import com.xdf.service.user.UserService;

public class UserServiceImpl implements UserService {

	private UserDao dao = new UserDaoImpl();

	Logger log = Logger.getLogger(UserServiceImpl.class);

	/**
	 * 注册新用户
	 */
	@Override
	public void register(Easybuy_User user) {
		int row = dao.add(user);
		if (row > 0) {
			log.debug("用户注册成功！");
		} else {
			log.debug("用户注册失败！");
		}
	}

	/**
	 * 登录
	 */
	@Override
	public Easybuy_User login(String userName, String password) {
		Easybuy_User user = dao.login(userName, password);
		if (user == null) {
			log.debug("用户登录失败！");
			return null;
		} else {
			log.debug("用户登录成功！");
			return user;
		}
	}

	/**
	 * 查询所有
	 */
	@Override
	public List<Easybuy_User> findAllUsers(Object... params) {
		List<Easybuy_User> list = dao.findAll(params);
		// 加入memcache
		if (list != null) {
			log.debug("查询所有用户信息成功！");
		} else {
			log.debug("查询所有用户信息失败！");
		}
		return list;
	}

	/**
	 * 新增用户
	 */
	@Override
	public boolean addUser(Easybuy_User user) {
		int num = dao.add(user);
		if (num > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除用户
	 */
	@Override
	public boolean deleteUser(String id) {
		int num = dao.delete(id);
		if (num > 0) {
			log.debug("删除用户信息成功！");
			return true;
		} else {
			log.debug("删除用户信息失败！");
			return false;
		}
	}

	/**
	 * 查询指定的用户信息
	 */
	@Override
	public Easybuy_User findOne(String id) {
		Easybuy_User user = dao.findOne(id);
		if (user != null) {
			log.debug("查询指定的用户信息成功！");
			return user;
		} else {
			log.debug("没有查询到指定的用户信息！");
			return null;
		}

	}

	/**
	 * 修改用户
	 */
	@Override
	public boolean update(Easybuy_User user) {
		int num = dao.update(user);
		if (num > 0) {
			log.debug("修改用户信息成功！");
			return true;
		} else {
			log.debug("修改用户信息失败！");
			return false;
		}
	}

}
