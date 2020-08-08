package com.qf.service.impl;

import com.qf.dao.IAuthDao;
import com.qf.entity.Role;
import com.qf.entity.User;
import com.qf.service.IAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AuthServiceImpl implements IAuthService {

    @Autowired
    private IAuthDao authDao;

    @Override
    public List<Role> getRoleList() {
        return authDao.getRoleList();
    }

    @Override
    public int addUserRole(List<Integer> userIds, Integer roleId) {
        return authDao.addUserRole(userIds,roleId);
    }

    @Override
    public int getRoleByUids(List<Integer> ids, Integer roleId) {
        return authDao.getRoleByUids(ids,roleId);
    }

    @Override
    public List<User> getUserListByRoleId(Integer roleId) {
        return authDao.getUserListByRoleId(roleId);
    }

    @Override
    public List<Map<String, Object>> getPerListByRoleId(Integer roleId) {
        return authDao.getPerListByRoleId(roleId);
    }

    @Override
    public int addPerByRoleId(List<Integer> perIdList, Integer roleId) {
        return authDao.addPerByRoleId(perIdList,roleId);
    }

    @Override
    public void deleteRolePer(List<Integer> perIdList, Integer roleId) {
        authDao.deleteRolePer(perIdList,roleId);
    }
}
