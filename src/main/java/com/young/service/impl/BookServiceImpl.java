package com.young.service.impl;

import com.young.dao.BookDao;
import com.young.entity.Book;
import com.young.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> queryBooks() {
        return bookDao.queryBooks();
    }

    @Override
    public List<Book> queryBookById(int id) {
        return bookDao.queryBookById(id);
    }

    @Override
    public List<Book> queryBookByType_id(int type_id) {
        return bookDao.queryBookByType_id(type_id);
    }

    @Override
    public List<Book> queryBookByName(String name) {
        return bookDao.queryBookByName(name);
    }

    @Override
    public List<Book> queryCollectBook(int user_id) {
        return bookDao.queryCollectBook(user_id);
    }
}
