package com.young.service.impl;

import com.young.dao.UserDao;
import com.young.entity.User;
import com.young.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> queryUsers() {
        return userDao.queryUsers();
    }

    @Override
    public List<User> queryUsersById(int user_id) {
        return userDao.queryUsersById(user_id);
    }

    @Override
    public int updatePassword(int user_id, String password) {
        return userDao.updatePassword(user_id,password);
    }

    @Override
    public int insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int updatePwd(int user_id, String user_password, String user_protection) {
        return userDao.updatePwd(user_id,user_password,user_protection);
    }
}
