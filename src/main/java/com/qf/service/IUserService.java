package com.qf.service;

import com.qf.base.service.IBaseService;
import com.qf.entity.User;

import java.util.List;

public interface IUserService extends IBaseService<User> {
    int batchDel(List<Integer> ids);

    int delete(List<Integer> id);

    void deleteById(Integer id);
}
