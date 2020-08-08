package com.qf.dao;

import com.qf.entity.Role;
import com.qf.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IAuthDao {
    List<Role> getRoleList();

    int addUserRole(@Param("userIds") List<Integer> userIds, @Param("roleId") Integer roleId); // ?

    int getRoleByUids(@Param("userIds") List<Integer> userIds, @Param("roleId") Integer roleId);

    List<User> getUserListByRoleId(Integer roleId);

    List<Map<String,Object>> getPerListByRoleId(Integer roleId);

    int addPerByRoleId(@Param("perIdsList") List<Integer> perIdList, @Param("roleId") Integer roleId);

    void deleteRolePer(@Param("perIdsList") List<Integer> perIdList, @Param("roleId") Integer roleId);
}
