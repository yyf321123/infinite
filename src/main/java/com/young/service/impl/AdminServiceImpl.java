package com.young.service.impl;

import com.young.dao.AdminDao;
import com.young.entity.Admin;
import com.young.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public List<Admin> queryAdmin() {
        return adminDao.queryAdmin();
    }
}
