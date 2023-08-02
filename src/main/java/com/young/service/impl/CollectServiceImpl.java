package com.young.service.impl;

import com.young.dao.CollectDao;
import com.young.entity.Collect;
import com.young.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("collectService")
public class CollectServiceImpl implements CollectService {

    @Autowired
    private CollectDao collectDao;


    @Override
    public int insertCollect(String user_id, String id) {
        return collectDao.insertCollect(user_id,id);
    }

    @Override
    public List<Collect> queryCollects() {
        return collectDao.queryCollects();
    }

    @Override
    public int deleteCollect(int collect_id) {
        return collectDao.deleteCollect(collect_id);
    }
}
