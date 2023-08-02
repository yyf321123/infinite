package com.young.dao;

import com.young.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    // 查询全部
    List<Book> queryBooks();

    // 根据id查询
    List<Book> queryBookById(@Param("id") int id);

    // 根据type_id查询
    List<Book> queryBookByType_id(@Param("type_id") int type_id);

    // 根据书名查询
    List<Book> queryBookByName(@Param("name") String name);

    // 根据用户id查询用户收藏的书籍
    List<Book> queryCollectBook(@Param("user_id") int user_id);
}
