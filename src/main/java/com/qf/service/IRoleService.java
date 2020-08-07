package com.qf.service;

import com.qf.base.service.IBaseService;
import com.qf.entity.Role;
import com.qf.entity.User;

import java.util.List;

public interface IRoleService extends IBaseService<Role> {
    void deleteById(Integer id);

    int batchDel(List<Integer> ids);

}
