package com.qf.service;

import com.qf.base.service.IBaseService;
import com.qf.entity.Permission;

import java.util.List;

public interface IPermissionService extends IBaseService<Permission> {
    List<Permission> getPerListByPid(Integer pid);
}
