package com.qf.service;

import com.qf.entity.Role;
import com.qf.entity.User;

import java.util.List;
import java.util.Map;

public interface IAuthService {

    public List<Role> getRoleList();

    int addUserRole(List<Integer> ids, Integer roleId);

    int getRoleByUids(List<Integer> ids, Integer roleId);

    List<User> getUserListByRoleId(Integer roleId);

    List<Map<String,Object>> getPerListByRoleId(Integer roleId);

    int addPerByRoleId(List<Integer> perIdList, Integer roleId);

    void deleteRolePer(List<Integer> perIdList, Integer roleId);
}
