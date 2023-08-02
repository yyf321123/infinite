package com.young.dao;

import com.young.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    // 查询
    List<User> queryUsers();

    // 通过id查询
    List<User> queryUsersById(@Param("user_id") int user_id);

    // 修改密码
    int updatePassword(@Param("user_id") int user_id, @Param("password") String password);

    // 注册
    int insertUser(User user);

    // 修改个人资料
    int updateUser(User user);

    // 修改密码和密保
    int updatePwd(@Param("user_id") int user_id, @Param("user_password") String user_password, @Param("user_protection") String user_protection);
}
