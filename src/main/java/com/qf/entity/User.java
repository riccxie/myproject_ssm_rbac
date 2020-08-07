package com.qf.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class User {

    private Integer id;


    private String username;


    private String password;


    private Integer age;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;


    private Date createTime;


    private Integer createUser;


    private Date updateTime;


    private Integer updateUser;


    private String email;


    private Integer flag;


    private String png;

    private Integer sex;


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }


    public Integer getAge() {
        return age;
    }


    public void setAge(Integer age) {
        this.age = age;
    }


    public Date getBirthday() {
        return birthday;
    }


    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }


    public Date getCreateTime() {
        return createTime;
    }


    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public Integer getCreateUser() {
        return createUser;
    }


    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }


    public Date getUpdateTime() {
        return updateTime;
    }


    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public Integer getUpdateUser() {
        return updateUser;
    }


    public void setUpdateUser(Integer updateUser) {
        this.updateUser = updateUser;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }


    public Integer getFlag() {
        return flag;
    }


    public void setFlag(Integer flag) {
        this.flag = flag;
    }


    public String getPng() {
        return png;
    }


    public void setPng(String png) {
        this.png = png == null ? null : png.trim();
    }
}
