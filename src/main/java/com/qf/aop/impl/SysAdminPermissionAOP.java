package com.qf.aop.impl;

import com.qf.aop.bean.Permission;
import com.qf.doamin.SystemAdmin;
import com.qf.entity.BusinessException;
import com.qf.utils.Constants;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.Set;

@Aspect // 表示这个是一个切面
@Component // 让spring容器扫描到
public class SysAdminPermissionAOP {

    @Autowired
    private HttpSession session;

    public SysAdminPermissionAOP(){
        System.err.println("=================================");
    }

    @Around("@annotation(permission)") // 只有调用加了@Permissiond方法的时候才会进入到这个方法里面
    public Object hanlderPermission(ProceedingJoinPoint joinPoint, Permission permission){
        System.out.println("SysAdminPermissionAOP.hanlderPermission");

        // 1.获取当前登录用户的权限码
        SystemAdmin systemAdmin= (SystemAdmin) session.getAttribute(Constants.SESSION_USER);
        Set<String> perSet = systemAdmin.getPerSet();

        // 2.获取用户正在访问的资源的权限
        String value1 = permission.value();

        // 3.判断是否包含
        if(!perSet.contains(value1)){
            throw  new BusinessException(10003,"你没有权限访问这个资源。。。。");
        }

        Object proceed = null;
        try {
            Object[] args = joinPoint.getArgs(); // 获取正在调用方法的参数
            proceed = joinPoint.proceed(args); // 调用Controller
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return  proceed;
    }
}
