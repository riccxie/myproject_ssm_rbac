package com.qf.ssm;

import com.qf.entity.User;
import com.qf.service.IUserService;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@ContextConfiguration(value = "classpath:spring-context.xml")
@RunWith(value= SpringJUnit4ClassRunner.class)
public class InitTest {
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Autowired
    private IUserService userService;

    @Test
    public void testSqlSessionFactory(){
        System.out.println(sqlSessionFactory);
    }

    @Test
    public void testAddUser(){
        User user = new User();
        user.setUsername("admin");
        user.setPassword("admin");
        user.setAge(28);
        user.setEmail("fs2jjj@qq.com");
        user.setSex(1);
        user.setPng("dfdf.png");
        user.setBirthday(new Date());
        user.setCreateUser(1);
        user.setUpdateUser(1);

        int insert = userService.insert(user);
        System.out.println(insert);
    }
}
