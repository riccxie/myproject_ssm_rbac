package com.qf.service.impl;

import com.qf.base.dao.IBaseDao;
import com.qf.base.service.BaseServiceImpl;
import com.qf.dao.IRoleDao;
import com.qf.dao.IUserDao;
import com.qf.entity.Role;
import com.qf.entity.User;
import com.qf.service.IRoleService;
import com.qf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    protected IBaseDao<Role> baseDao() {
        return roleDao;
    }

//    @Override
//    public int batchDel(List<Integer> ids) {
//        return userDao.batchDel(ids);
//    }
//
//
//    @Autowired
//    public IUserDao getuserDao() {
//        return userDao;
//    }
//
//    public void setUserDao(IUserDao userDao) {
//        this.userDao = userDao;
//    }
//    @Override
//    public void deleteById(Integer id) {
//        //删除一条
//        userDao.deleteById(id);
//    }


}
