package com.qf.dao;

import com.qf.base.dao.IBaseDao;
import com.qf.entity.Permission;

import java.util.List;

public interface IPermissionDao extends IBaseDao<Permission> {
    List<Permission> getPerListByPid(Integer pid);

    void deleteById(Integer id);

    int batchDel(List<Integer> ids);
}
