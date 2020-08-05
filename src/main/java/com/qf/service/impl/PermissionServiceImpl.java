package com.qf.service.impl;

import com.qf.base.dao.IBaseDao;
import com.qf.base.service.BaseServiceImpl;
import com.qf.dao.IPermissionDao;
import com.qf.entity.Permission;
import com.qf.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements IPermissionService {

    @Autowired
    private IPermissionDao permissionDao;

    @Override
    protected IBaseDao<Permission> baseDao() {
        return permissionDao;
    }
}
