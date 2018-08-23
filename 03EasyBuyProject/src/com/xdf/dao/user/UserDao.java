package com.xdf.dao.user;

import com.xdf.bean.Easybuy_User;
import com.xdf.dao.CommonDao;

public interface UserDao extends CommonDao<Easybuy_User> {

	/**
	 * 登录
	 */
	Easybuy_User login(String userName, String password);

}
