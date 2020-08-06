package com.qf.service.impl;

import com.qf.base.dao.IBaseDao;
import com.qf.base.service.BaseServiceImpl;
import com.qf.dao.IUserDao;
import com.qf.entity.User;
import com.qf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Override
    protected IBaseDao<User> baseDao() {
        return userDao;
    }

    @Override
    public int batchDel(List<Integer> ids) {
        return userDao.batchDel(ids);
    }



    public IUserDao getuserDao() {
        return userDao;
    }

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }
    @Override
    public void deleteById(Integer id) {
        //删除一条
        userDao.deleteById(id);
    }


}
