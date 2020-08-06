package com.qf.dao;

import com.qf.base.dao.IBaseDao;
import com.qf.entity.User;

import java.util.List;

public interface IUserDao extends IBaseDao<User>{
    int batchDel(List<Integer> ids);

    int delete(List<Integer> id);

    void deleteById(Integer id);
}

