package com.qf.doamin;

import lombok.Data;

import java.util.Set;

/**
 * 这个实体类主要是保存当前登录用户信息
 */
@Data
public class SystemAdmin {

    private Integer id;

    private String username;

    private String password;

    private String email;

    private Set<String> perSet; // set 无序，不可重复

}
