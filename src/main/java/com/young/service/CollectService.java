package com.young.service;

import com.young.entity.Collect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollectService {

    // 加入收藏（新增）
    // @user_id ---> 用户id
    // @id ---> 书籍id
    int insertCollect(@Param("user_id") String user_id, @Param("id") String id);

    // 查询
    List<Collect> queryCollects();

    // 取消收藏
    int deleteCollect(@Param("collect_id") int collect_id);

}
