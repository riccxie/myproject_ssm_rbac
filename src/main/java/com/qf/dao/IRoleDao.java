package com.qf.dao;

import com.qf.base.dao.IBaseDao;
import com.qf.entity.Role;
import com.qf.entity.User;

import java.util.List;

public interface IRoleDao extends IBaseDao<Role>{
    void deleteById(Integer id);

    int batchDel(List<Integer> ids);

}

